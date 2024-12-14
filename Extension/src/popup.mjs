// import { getDataCheckedTask, putDataWatchedTask, getDataToCheckTask, getDataEpisodesTask, } from './requests.mjs';

import { ProgressObserver, EpisodeDataObserver, MessagesObserver } from './popup_observers.mjs';
import { Model } from './model.mjs';

/**
 * Extension
 */

class Extension {
  apiBaseURL = null;
  browser = null;
  activeTab = null;
  siegePort = null;
  siegePort2 = null;
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
    // this.browser.windows.getCurrent({ populate: true }).then(obj => {
    //   console.dir(obj);
    // });

    this.browser.tabs.sendMessage(tab.id, { action: "getImages" }, res => {

    });
    return tab ?? null;
  }

  async init(url) {
    this.apiBaseURL = url;
    this.activeTab = await this.getCurrentTab();

    this.browser.runtime.onConnectExternal.addListener(port => {
      console.log('ini onConnectExternal ');
      console.dir(port);
      this.siegePort = port;
      this.siegePort.onMessage.addListener(port => {
        console.log('onConnectExternal');
      });
    });

    this.browser.runtime.onConnect.addListener(port => {
      console.log('ini onConnect ');
      console.dir(port);
      this.siegePort2 = port;
      this.siegePort2.onMessage.addListener(port => {
        console.log('onConnect');
      });
    });

    // this.siegePort = this.browser.tabs.connect(this.activeTab.id);
    // this.siegePort.postMessage(`init`);
    // this.siegePort.onDisconnect.addListener(port => {
    //   console.dir(port);
    // });
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
  return;
  const ext = new Extension(window.browser || window.chrome);

  ext.observers.prgData = new EpisodeDataObserver(
    document.querySelector('table#programs'),
    ['name','airedOn','type','seriesId','programId']
  );
  ext.observers.sendPrg = new ProgressObserver(document.querySelector('progress#send'));
  ext.observers.recvPrg = new ProgressObserver(document.querySelector('progress#recv'));
  ext.observers.infoMsg = new MessagesObserver(document.querySelector('ul#messages'));


  const url = 'http://192.168.50.200:9080';
  // const url = 'http://99.225.140.148:9080';
  // 6085881137214872112

  await ext.init(url);
  await ext.run();

  setTimeout(() => {
    window.top.postMessage('I\'m loaded popup.mjs', '*');
  }, 3000);

}, 100);

















class ObservableMessageQueue {
  #messages = new Map;
  #handlers = new Map;

  has(key) {
    return this.#messages.has(key);
  }

  set(key, msg) {
    console.log('key', key);
    console.dir(msg);

    this.#messages.set(key, msg);
    this.notify();
  }

  del(key) {
    return this.#messages.delete(key);
  }

  get(key) {
    if (this.#messages.has(key)) {
      return this.#messages.get(key);
    }

    return undefined;
  }

  nth(n) {
    if (n < this.#messages.size) {
      return this.#messages.values()[n];
    }

    return undefined;
  }

  attach(key, handler) {
    this.#handlers.set(key, handler);
  }

  detach(key) {
    return this.#handlers.delete(key);
  }

  notify() {
    for (const [key, handler] of this.#handlers) {
      if (typeof handler === 'function') {
        handler(key);
      }
    }
  }
}


class SiegeChannel {
}
class StashChannel {
}







const PID_LENGTH = 19;

class _Extension {
  apiUrl = null;
  browser = null;
  activeTab = null;
  ctrlPort = null;
  dataPort = null;
  queue = new ObservableMessageQueue;
  observers = { 'sendPrg':null, 'recvPrg': null, 'prgData':null, 'infoMsg': null };

  constructor(browser, tab, url) {
    this.browser = browser;
    this.activeTab = tab;
    this.apiUrl = url;

    this.browser.runtime.onConnectExternal.addListener(port => {
      console.log('_Ext got connect');
      this.dataPort = port;
      /*
      this.dataPort.onDisconnect.addListener(port => {
        this.dataPort = null;
      })
      this.dataPort.onMessage.addListener(msg => {
        console.log('onMessage[0]', msg);
      });
      */

/*
      const req = new PortRequestSingle(this.dataPort);
      req.init().fetch('getWatchedPrograms')
      .then(res => {
        console.log('then', performance.now());
        console.log(typeof res);
        console.dir(res);
      })
      .catch(err => console.dir)
      .finally(() => req.term());
*/

      // this.process();
      const mod = new Model(this.dataPort);
      mod.process();
    });

    // Send message to have the runner.mjs script connect to this extension
    this.ctrlPort = this.browser.tabs.connect(this.activeTab.id);
    this.ctrlPort.postMessage('connect');
    this.ctrlPort.disconnect();
  }


  async handlerForProgramsNeedingProgramInfo() {
    const handler = new Promise((resolve, reject) => {
      this.queue.attach('newprograms', key => {
        if (this.queue.has('tocheck') && this.queue.has('checked')) {
          const checked = this.queue.get('checked');
          const toCheck = this.queue.get('tocheck');
          // console.dir(checked);
          // console.dir(toCheck);
          for (const k in toCheck) {
            if (k in checked) {
              delete toCheck[k];
            }
          }

          this.queue.detach('newprograms');
          this.queue.del('tocheck');
          this.queue.del('checked');

          resolve(toCheck);
        }
      });
      // do timeout
    });

    return handler;
  }

  // returns: promise that resolves on receiving data and creating a set of programIds
  // that we need further information for
  async getProgramsNeedingProgramInfo() {
    const dataFetched = this.handlerForProgramsNeedingProgramInfo();

    // request data: toCheck
    this.dataPort.postMessage('getWatchedPrograms');

    // request data: checked
    fetch(this.apiUrl+'/watched', {'method':'GET', 'signal': AbortSignal.timeout(1000)})
    .then(res => {
      if (res.ok && res.status === 200) {
        const json = res.json();
        return json;
      }

      return null;
    })
    // .catch (err => {
    //   console.log('-- ', err.message);
    //   return null;
    // })
    .then(data => {
      this.queue.set('checked', data);
    });

    return dataFetched;
  }

  // Find the program ids that haven't been queried via the injected api by removing those ids that are stored in the
  // local database. This is to limit api requests as to limit the possibility of any issues, and why requery the
  // same data repeatedly when the data won't change.

  async requestProgramInfoWhereMissing(toCheck, len) {
    const keys = Object.keys(toCheck);
    let nth = 0;
    this.observers.sendPrg?.update(++nth, len);

    const id = setInterval(() => {
      const k = keys.pop();
      this.dataPort.postMessage(`getProgramEntity|${k}`);

      this.observers.sendPrg?.update(++nth, len);
      if (nth === len) {
        clearInterval(id);
      }
    }, 100);
  }

  async handleProgramInfoResponses(toCheck, len) {
    let nth = 0;

    this.queue.attach('program', key => {
      if (key.length === 2+PID_LENGTH && key.startsWith('ep')) {
        const programId = key.substring(2);
        const watchedOn = toCheck[programId];
        constructor
        this.observers.recvPrg?.update(++nth, len);
      }
    });
  }

  /*
  toCheck:
  {
    {
      programId: "5752128241908407112",
      watchedOn: "2024-12-04"
    },
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

  // async

  async process() {
    const toCheck = await this.getProgramsNeedingProgramInfo();
    console.dir(toCheck);
    const len = Object.keys(toCheck).length;
    this.observers.sendPrg?.update(0, len);
    this.observers.recvPrg?.update(0, len);

    this.handleProgramInfoResponses(toCheck, len);
    this.requestProgramInfoWhereMissing(toCheck, len);
  }
}



const apiUrl = 'http://192.168.50.200:9080';
const webRex = /rogers\.com/;

const browser = window.browser || window.chrome;
browser.tabs.query({ active: true, currentWindow: true })
.then(tabs => {
  const [tab] = tabs;

  if (!tab) throw 'Tab is null';
  if (tab.status !== 'complete') throw 'Site not finished loading!';
  if (!webRex.test(tab.url)) throw 'Not correct website!';

  const ext = new _Extension(browser, tab, apiUrl);

  ext.observers.prgData = new EpisodeDataObserver(
    document.querySelector('table#programs'),
    ['name','airedOn','type','seriesId','programId']
  );
  ext.observers.sendPrg = new ProgressObserver(document.querySelector('progress#send'));
  ext.observers.recvPrg = new ProgressObserver(document.querySelector('progress#recv'));
  ext.observers.infoMsg = new MessagesObserver(document.querySelector('ul#messages'));

  // ext.process();
  // ...
})
.catch(err => {
  window.close();
  alert(err);
});
