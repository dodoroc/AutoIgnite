import {ProgressObserver, EpisodeDataObserver, MessagesObserver} from './popup_observers.mjs';
/**
 * Extension
 */

class Extension {
  apiBaseURL = null;
  browser = null;
  activeTab = null;
  siegePort = null;
  dispatch = cargo => {};

  toCheck = {};
  checked = {};

  observers = { 'sendPrg':null, 'recvPrg': null, 'prgData':null, 'infoMsg': null };

  constructor(browser) {
    this.browser = browser;
  }

  async getCurrentTab() {
    const queryOptions = { active: true, currentWindow: true };
    const [tab] = await this.browser.tabs.query(queryOptions);
    return tab ?? null;
  }

  async init(url) {
    this.apiBaseURL = url;
    this.activeTab = await this.getCurrentTab();

    this.browser.runtime.onConnectExternal.addListener(port => {
      port.onMessage.addListener(this.dispatch);
    });

    this.siegePort = this.browser.tabs.connect(this.activeTab.id);
  }

  // shows we checked previously and will skip this run
  // returns obj {id0:null ... idn:null}}
  async getWatchedCheckedData() {
    return fetch(this.apiBaseURL+'/watched', {'method':'GET'})
    .then(response => {
      if (!response.ok) {
        throw new Error(`Response status: ${response.status}`);
      }

      if (response.status === 200) {
        return response.json();
      }

      return {};
    })
    .catch (error => {
      console.log('-- ', error.message);
      return {};
    });
  }

  // shows that were watched and include previously checked ones (ext api)
  // returns obj {id0:{programId:<num>, watchedOn:<date>} ... idn:{programId:<num>, watchedOn:<date>}}
  async getWatchedToCheckData() {
    const received = new Promise(resolve => {
      this.dispatch = resolve;
    });

    this.siegePort.postMessage('getWatchedPrograms');

    return received.then(response => {
      this.dispatch = cargo => {};
      return response;
    });
  }

  async updateWatchedData(watched) {
    const body = JSON.stringify(watched);

    const options = {
      headers: {
        'Content-Type': 'application/json'
      },
      method: 'PUT',
      body
    };

    return fetch(this.apiBaseURL+'/watched', options)
    .then(response => (response.status === 200));
  }

  async updateEpisodeData(eps) {
    const body = JSON.stringify(eps);

    const options = {
      headers: {
        'Content-Type': 'application/json'
      },
      method: 'PUT',
      body
    };

    return fetch(this.apiBaseURL+'/episode', options)
    .then(response => (response.status === 200));
  }

  // Find the program ids that haven't been queried via the injected api by removing those ids that are stored in the
  // local database. This is to limit api requests as to limit the possibility of any issues, and why requery the
  // same data repeatedly when the data won't change.
  findNewlyAddedWatchedItems() {
  /*
    const arrToObj = (arr) => {
      return arr.reduce((obj, item) => {
        obj[item.programId] = item.watchedOn;
        return obj;
      }, {});
    };

    const toCheck = this.toCheck.filter(obj => {
      return !this.checked.some(item => item.programId === obj.programId);
    });
    11.6 op/s

    const toCheck = this.toCheck.filter(wObj =>
      !this.checked.some((iObj, ndx) => {
        if (iObj.programId === wObj.programId) {
          this.checked[ndx].programId = this.checked.pop().programId;
          return true;
        }
        return false;
      })
    );
    194 op/s

    toCheck = watched - ignored
    const igSet = new Set(this.checked.flatMap(obj => obj.parentId));
    const toCheck = this.toCheck.filter(obj => !igSet.has(obj.parentId));
    636 op/s
  */

    for (const k in this.toCheck) {
      if (k in this.checked) {
        delete this.toCheck[k];
      }
    }

    this.checked = {};
  }

  // Request data for a specific set of programs
  sendProgramInfoRequests(delay_ms) {
    return new Promise(resolve => {
      const tcKeys = Object.keys(this.toCheck);
      const itemCnt = tcKeys.length;
      let remItemCnt = itemCnt;
      let nth = 0;

      const intr = setInterval(() => {
        if (tcKeys.length) {
          this.observers.sendPrg?.update(++nth, itemCnt);

          const k = tcKeys.pop();
          this.siegePort.postMessage(`getProgramEntity|${k}`);
          remItemCnt -= 1;
        }
        else {
          clearInterval(intr);
          resolve(remItemCnt);
        }

      }, delay_ms);
    });
  }

  recvProgramInfoResponse(delay_ms, batch_size) {
    const queue = [];

    this.dispatch = pgm => {
      if (pgm?.programId) {
        pgm.watchedOn = this.toCheck[pgm.programId].watchedOn;
        delete this.toCheck[pgm.programId];
        queue.push(pgm);

        this.observers.prgData?.update(pgm);
      }
    };

    return new Promise((resolve, reject) => {
      const itemCnt = Object.keys(this.toCheck).length;
      let remItemCnt = itemCnt;
      let nth = 0;

      const dur = 500 + delay_ms * itemCnt * 100;
      const tout = setTimeout(() => {
        console.log('recvProgramInfoResponse timeout');
        this.dispatch = cargo => {};
        clearInterval(intr);
        reject(remItemCnt);
      }, dur);

      const intr = setInterval(() => {
        const len = Object.keys(this.toCheck).length;
        if (len || queue.length) {
          const batch = queue.splice(0, batch_size);
          this.updateWatchedData(batch);
          remItemCnt -= batch.length;
          // console.log('remItemCnt', remItemCnt);
          nth += batch.length;
          this.observers.recvPrg?.update(nth, itemCnt);
        }
        else {
          console.log('recvProgramInfoResponse clearInterval');
          this.dispatch = cargo => {};
          clearTimeout(tout);
          clearInterval(intr);
          resolve(remItemCnt);
        }

      }, delay_ms * batch_size);
    });

  }

  async fetchWatchedData() {
    // Fetch all required data
    const p1 = this.getWatchedToCheckData();
    const p2 = this.getWatchedCheckedData();

    const [r1, r2] = await Promise.allSettled([p1, p2]);

    // toCheck from xtv provider aka watchedPrograms api call
    // checked from local db, already checked programs
    this.toCheck = r1.value;
    this.checked = r2.value;
  }

  async run() {
    const DELAY_MS = 67;
    const BATCH_SIZE = 10;

    this.observers.infoMsg?.update('Starting');

    await this.fetchWatchedData();

    this.findNewlyAddedWatchedItems();
    const fullCnt = Object.keys(this.toCheck).length;

    if (fullCnt) {
      const send = this.sendProgramInfoRequests(DELAY_MS);
      const recv = this.recvProgramInfoResponse(DELAY_MS, BATCH_SIZE);
      const [sendCnt, recvCnt] = await Promise.allSettled([send, recv]);

      console.log(`Items processed ${fullCnt}`);
      console.log(`send(missed): ${sendCnt.value} items`);
      console.log(`recv(missed): ${recvCnt.value ?? recvCnt.reason} items`);
    }
    else {
      this.observers.infoMsg?.update('Nothing to process');
    }

    this.observers.infoMsg?.update('Finished');
  }
}


/**
 * Execution start
 * Small delay to give the sieged site time to settle after
 * the extension injects the various assets. Increase delay
 * to open devtools...
 *
 */

setTimeout(async () => {
  // return;
  const ext = new Extension(window.browser || window.chrome);

  ext.observers.prgData = new EpisodeDataObserver(
    document.querySelector('table#programs'),
    ['name','airedOn','type','seriesId','programId']
  );
  ext.observers.sendPrg = new ProgressObserver(document.querySelector('progress#send'));
  ext.observers.recvPrg = new ProgressObserver(document.querySelector('progress#recv'));
  ext.observers.infoMsg = new MessagesObserver(document.querySelector('ul#messages'));


  // const url = 'http://192.168.50.200:9080';
  const url = 'http://99.225.140.148:9080';
  // 6085881137214872112

  await ext.init(url);
  await ext.run();
}, 100);
