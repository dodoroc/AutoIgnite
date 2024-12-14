
class PortRequestSingle {
  #port = null;
  #response = null;
  #timerId = 0;
  #timeout = 0;

  #onTimeout = () => null;
  #onDisconnect = () => null;
  #onMessage = () => null;

  constructor(port, timeout) {
    this.#port = port;
    this.#timeout = timeout || 30000;
  }

  init() {
    console.assert(!(this.#port.onMessage.hasListeners() === true), `${this.constructor.name}::init; onMessage must not have listeners attached!`);

    this.#response = new Promise((resolve, reject) => {
      this.#onTimeout = () => reject(new Error(`${this.constructor.name} Request timeout`));
      this.#onDisconnect = port => reject(new Error(`${this.constructor.name} Port disconnected`));
      this.#onMessage = msg => resolve(msg);

      this.#port.onDisconnect.addListener(this.#onDisconnect);
      this.#port.onMessage.addListener(this.#onMessage);
    });

    return this;
  }

  term() {
    // console.log(`${this.constructor.name}::term`, performance.now());
    clearTimeout(this.#timerId);
    this.#port.onDisconnect.removeListener(this.#onDisconnect);
    this.#port.onMessage.removeListener(this.#onMessage);
    this.#response = null;
  }

  async fetch(cmd) {
    this.#port.postMessage(cmd);
    this.#timerId = setTimeout(this.#onTimeout, this.#timeout);
    return this.#response;
  }
}

const STATE_STOPPED = 0;
const STATE_RUNNING = 1;
const STATE_TIMEOUT = 2;
const STATE_DISCONN = 4;
const STATE_ERROR   = 8;

class PortRequestIterator {
  #port = null;
  // #response = null;
  #timerId = 0;
  #timeout = 0;
  #data = [];

  #onTimeout = () => null;
  #onDisconnect = () => null;
  #onMessage = () => null;

  #state = STATE_RUNNING;
  get state() {
    return this.#state;
  }
  set state(s) {
    this.#state = s;
  }

  #counts = { read: 0, write: 0 };
  get counts() {
    return this.#counts;
  }


  constructor(port, timeout) {
    this.#port = port;
    this.#timeout = timeout || 30000;
  }

  init() {
    console.assert(!(this.#port.onMessage.hasListeners() === true), `${this.constructor.name}::init; onMessage must not have listeners attached!`);

    this.#onTimeout = () => this.#state = STATE_TIMEOUT;
    this.#onDisconnect = port => this.#state = STATE_DISCONN;
    this.#onMessage = msg => this.#data.push(msg);

    this.#port.onDisconnect.addListener(this.#onDisconnect);
    this.#port.onMessage.addListener(this.#onMessage);

    return this;
  }

  term() {
    // console.log('clean');
    clearTimeout(this.#timerId);
    this.#port.onDisconnect.removeListener(this.#onDisconnect);
    this.#port.onMessage.removeListener(this.#onMessage);
    this.#state = STATE_STOPPED;
  }

  send(cmd) {
    clearTimeout(this.#timerId);
    this.#timerId = setTimeout(this.#onTimeout, this.#timeout);
    this.#port.postMessage(cmd);
    this.#counts.write++;
  }


  #poller() {
    return new Promise(resolve => {
      if (this.#data.length) {
        this.#counts.read++;
        resolve(this.#data.shift());
      }
      else {
        const iid = setInterval(() => {
          if (this.#data.length) {
            clearInterval(iid);
            this.#counts.read++;
            resolve(this.#data.shift());
          }
          else {
            console.warn('in interval not read', Date.now());
          }
        }, 50);
      }
    });
  }

  * reader(max) {
    max = max || 0;
    while (this.#state === STATE_RUNNING && max-- > 0) {
      yield this.#poller();
    }
  }
}


class Fetch {
  #urlBase = null;
  #timeout = 0;

  constructor(urlBase, timeout) {
    this.#urlBase = urlBase;
    this.#timeout = timeout || 30000;
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

    return fetch(`${this.#urlBase}/${url}`, options)
    .then(response => (response.status === 200));
  }
}



















export class Model {
  #urlBase = 'http://192.168.50.200:9080';
  #timeout = 5000;
  #port = null;

  constructor(port) {
    this.#port = port;
  }

  // shows that were watched and include previously checked ones (ext api)
  // returns obj {id0:{programId:<num>, watchedOn:<date>} ... idn:{programId:<num>, watchedOn:<date>}}
  async getWatchedToCheckData() {
    const req = new PortRequestSingle(this.#port);
    return req.init().fetch('getWatchedPrograms')
    // .then(res => {
    //   console.log('then', performance.now());
    //   console.log(typeof res);
    //   console.dir(res);
    // })
    .catch(err => console.dir)
    .finally(() => req.term());

  }

  // shows we checked previously and will skip this run
  // returns obj {id0:null ... idn:null}}
  async getWatchedCheckedData() {
    const req = new Fetch(this.#urlBase, this.#timeout);
    return req.get('watched')
    // .then(data => data.json())
    .catch(err => console.error)
    .finally(data => data||{});
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

    for (const k in toCheck) {
      if (k in checked) {
        delete toCheck[k];
      }
    }

    return toCheck;
  }

  async process() {
    const watched = await this.getWatchedData();
    const numEps = Object.keys(watched).length;
    // console.dir(watched);
    console.log('item cnt', numEps);

    const programDetailRequestor = (new PortRequestIterator(this.#port, this.#timeout)).init();
    for (const k in watched) {
      programDetailRequestor.send(`getProgramEntity|${k}`)
      // console.log(k, watched[k].programId);
    }
    // console.dir(programDetailRequestor);

    const reader = programDetailRequestor.reader(numEps);
    for await (const res of reader) {
      console.dir(res);
    }
    // programDetailRequestor.done = true;
    // programDetailRequestor.states.done = true;
    // setTimeout(() => console.dir(programDetailRequestor), 5_000);
    setTimeout(() => console.dir(structuredClone(programDetailRequestor)), 10_000);
    // programDetailRequestor.term();
    console.dir(structuredClone(programDetailRequestor));
    console.dir(programDetailRequestor);

  }

  //
}
