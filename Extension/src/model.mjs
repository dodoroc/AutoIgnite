/*
For the port request classes both init and term must be called
*/

//
export class PortRequest {
  #port = null;

  #onDisconnect = () => { throw new Error('disconnect') };

  constructor(port) {
    this.#port = port;
  }

  init() {
    console.assert(!(this.#port.onMessage.hasListeners() === true), `${this.constructor.name}::init; onMessage must not have listeners attached!`);
    console.assert(!(this.#port.onDisconnect.hasListeners() === true), `${this.constructor.name}::init; onDisconnect must not have listeners attached!`);

    this.#port.onDisconnect.addListener(this.#onDisconnect);
    return this;
  }

  term() {
    this.#port.onDisconnect.removeListener(this.#onDisconnect);
  }

  /*
  Single request for data
  msg: command string in the format "command name|param1|paramN"
  timeout: int in milliseconds
  returns promise that resolves upon received a response
  */
  async fetch(msg, timeout) {
    const timeoutId = setTimeout(() => { throw new Error('timeout') }, timeout || 60_000);

    let isr = m => m;
    const interrupt = m => isr(m);
    this.#port.onMessage.addListener(interrupt);

    return new Promise(resolve => {
      isr = resolve;
      this.#port.postMessage(msg);
    })
    // .catch(err => console.error(err))
    .finally(() => {
      clearTimeout(timeoutId);
      this.#port.onMessage.removeListener(interrupt);
    });
  }

  send(msg) {
    this.#port.postMessage(msg);
  }

  /*
  Create generator to receive messages
  max: int which limits the number of reads
  timeout: int in milliseconds
  yields promises where each represents a received message
  */
  *receiver(max, timeout) {
    const timeoutId = setTimeout(() => { throw new Error('timeout') }, timeout || 60_000);

    let isr = m => m;
    const interrupt = m => isr(m);

    this.#port.onMessage.addListener(interrupt);

    for (let i = 0; i < max; i++) {
      yield new Promise(resolve => isr = resolve);
    }

    this.#port.onMessage.removeListener(interrupt);

    clearTimeout(timeoutId);
  }
}



export class BufferedPortRequest {
  #port = null;
  #timeoutId = 0;
  #buffer = [];

  #onMessage = val => this.#buffer.push(val);
  #onDisconnect = () => { throw new Error('disconnect') };
  #onTimeout = () => { throw new Error('timeout') };

  constructor(port) {
    this.#port = port;
  }

  init() {
    console.assert(!(this.#port.onMessage.hasListeners() === true), `${this.constructor.name}::init; onMessage must not have listeners attached!`);
    console.assert(!(this.#port.onDisconnect.hasListeners() === true), `${this.constructor.name}::init; onDisconnect must not have listeners attached!`);

    this.#port.onMessage.addListener(this.#onMessage);
    this.#port.onDisconnect.addListener(this.#onDisconnect);

    return this;
  }

  term() {
    this.#port.onDisconnect.removeListener(this.#onDisconnect);
    this.#port.onMessage.removeListener(this.#onMessage);
  }

  timeout(millis) {
    if (millis) {
      this.#timeoutId = setTimeout(this.#onTimeout, millis);
    }
    else {
      clearTimeout(this.#timeoutId);
    }

    return this;
  }

  send(msg) {
    this.#port.postMessage(msg);
  }

  empty() {
    return this.#buffer.length === 0;
  }

  size() {
    return this.#buffer.length;
  }

  clear() {
    this.#buffer.length = 0;
  }

  read(size) {
    const len = Math.max(0, Math.min(this.#buffer.length, size || 0));
    return len ? this.#buffer.splice(0, len) : undefined;
  }
}



export class Fetch {
  #urlBase = null;
  #timeout = 0;

  constructor(urlBase, timeout) {
    this.#urlBase = urlBase;
    this.#timeout = timeout || 30_000;
  }


  // shows we checked previously and will skip this run
  // returns obj {id0:null ... idn:null}}
  async get(url) {
    const options = {
      'signal': AbortSignal.timeout(this.#timeout),
      'method': 'GET',
    };

    return fetch(`${this.#urlBase}/${url}`, options)
    .then(res => {
      if (res.ok && res.status === 200) {
        return res.json();
      }

      return null;
    });
  }

  async put(url, data) {
    const options = {
      'signal': AbortSignal.timeout(this.#timeout),
      'method': 'PUT',
      'headers': { 'Content-Type': 'application/json' },
      'body': JSON.stringify(data),
    };

    return fetch(`${this.#urlBase}/${url}`, options);
    // .then(response => (response.status === 200));

  }
}



  /*
  toCheck:
  {
    "5752128241908407112":
    {
      programId: "5752128241908407112",
      watchedOn: "2024-12-04"
    },
    ...
  }

  checked:
  {
    "5752128241908407112": null,
    ...
  }

  programInfo:
  {
    airedOn: "2023-01-12"
    name: "Quarterfinal #8: Patton Oswalt, Candace Parker and Torrey DeVitto"
    programId: "6386587064318555112"
    season: 1
    seriesId: "7300511853304109112"
    type: "TVEpisode"
  }
  */






export class Model {
  #urlBase = 'http://192.168.50.200:9080';
  #timeout = 5_000;
  #port = null;

  constructor(port) {
    this.#port = port;
  }


  // shows that were watched and include previously checked ones (ext api)
  // returns obj {id0:{programId:<num>, watchedOn:<date>} ... idn:{programId:<num>, watchedOn:<date>}}
  async getWatchedToCheckData() {
    const req = new PortRequest(this.#port);
    return req.init()
    .fetch('getWatchedPrograms')
    .finally(() => req.term());
  }

  // shows we checked previously and will skip this run
  // returns obj {id0:null ... idn:null}}
  async getWatchedCheckedData() {
    const req = new Fetch(this.#urlBase, this.#timeout);
    return req.get('watched')
    // .then(data => {console.log(JSON.stringify(data)); return data})
    // .then(data => data.json())
    .catch(err => console.error(err));
  }

  async getWatchedData() {
    // Fetch all required data
    const p1 = this.getWatchedToCheckData();
    const p2 = this.getWatchedCheckedData();

    const [r1, r2] = await Promise.allSettled([p1, p2]);

    // toCheck from xtv provider aka watchedPrograms api call
    // checked from local db, already checked programs
    const toCheck = r1.value;
    const checked = r2.value;


    // console.dir(checked);
    // console.dir(toCheck);
    // console.dir({...toCheck});

    // for (const k in toCheck) {
    //   if (k in checked) {
    //     delete toCheck[k];
    //   }
    // }
    // let c = Math.ceil(Object.keys(checked).length * 6 / 10);
    for (const k in checked) {
      if (toCheck.hasOwnProperty(k)) {
        delete toCheck[k];
        // if (!c--) break;
      }
    }

    return toCheck;
  }

  async updateWatchedData(data) {
    // return false;
    const req = new Fetch(this.#urlBase, this.#timeout);
    return req.put('watched', data)
    .then(response => (response.status === 200))
    .catch(err => console.error(err));
  }


  // get details for a program and update database with said data
  async updateDetailsForWatched(watched, numEps, observers) {
    const comm = (new BufferedPortRequest(this.#port)).timeout(Math.max(1500, 250*numEps)).init();
    const batch = [], batchSize = Math.min(10, Math.ceil(numEps/3));
    let iid, nthSend = 0, nthRecv = 0;

    return new Promise(resolve => {
      const keys = Object.keys(watched);

      iid = setInterval(() => {
        if (keys.length) {
          const k = keys.shift();
          observers?.sendPrg?.update(nthSend += 1, numEps);
          comm.send(`getProgramEntity|${k}`);
        }

        const size = comm.size();
        if (size) {
          const pgm = comm.read(1)[0];
          pgm.watchedOn = watched[pgm.programId].watchedOn;
          batch.push(pgm);

          observers?.recvPrg?.update(nthRecv += 1, numEps);
          observers?.prgData?.update(pgm);

          if (batch.length >= batchSize) {
            this.updateWatchedData(batch);
            batch.length = 0;
          }
        }

        if (nthSend === numEps && nthRecv === numEps) {
          clearInterval(iid);
          resolve();
        }
      }, 200);
    })
    .catch(err => {
      clearInterval(iid);
      console.error(err);
      // TODO deal with errors properly
    })
    .finally(() => {
      comm.timeout(0).term();
      if (batch.length) {
        this.updateWatchedData(batch);
        batch.length = 0;
      }
    });
  }

  async searchByTerm(query) {
    const req = new PortRequest(this.#port);
    return req.init()
    .fetch(`searchByTerm|${query}`)
    .finally(() => req.term());
  }

  // get program details for episodes that are due to air, the recordable listings are
  // also available in the same results that will eventually be processed
  async getUpcomingListingsBySeriesId(seriesId) {
    const req = new PortRequest(this.#port);
    return req.init()
    .fetch(`getProgramUpcomingListings|${seriesId}`)
    .finally(() => req.term());
  }

  // get array of titles for a series that haven't been watched yet
  async getUnwatchedTitlesBySeriesId(seriesId) {
    const req = new Fetch(this.#urlBase, this.#timeout);
    return req.get(`series/${seriesId}/unwatched`)
    .catch(err => console.error(err));
  }



  /*
  async getUpcomingForUnwatched(_unwatched) {
    const comm = (new BufferedPortRequest(this.#port)).timeout(Math.max(1500, 250*numEps)).init();
    const batch = [], batchSize = Math.min(10, Math.ceil(numEps/3));
    let iid, nthSend = 0, nthRecv = 0;

    return new Promise(resolve => {
      const keys = Object.keys(watched);

      iid = setInterval(() => {
        if (keys.length) {
          const k = keys.shift();
          observers?.sendPrg?.update(nthSend += 1, numEps);
          comm.send(`getProgramEntity|${k}`);
        }

        const size = comm.size();
        if (size) {
          const pgm = comm.read(1)[0];
          pgm.watchedOn = watched[pgm.programId].watchedOn;
          batch.push(pgm);

          observers?.recvPrg?.update(nthRecv += 1, numEps);
          observers?.prgData?.update(pgm);

          if (batch.length >= batchSize) {
            this.updateWatchedData(batch);
            batch.length = 0;
          }
        }

        if (nthSend === numEps && nthRecv === numEps) {
          clearInterval(iid);
          resolve();
        }
      }, 200);
    })
    .catch(err => {
      clearInterval(iid);
      console.error(err);
      // TODO deal with errors properly
    })
    .finally(() => {
      comm.timeout(0).term();
      if (batch.length) {
        this.updateWatchedData(batch);
        batch.length = 0;
      }
    });
  }
  //*/

}
