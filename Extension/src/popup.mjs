// import { getDataCheckedTask, putDataWatchedTask, getDataToCheckTask, getDataEpisodesTask, } from './requests.mjs';

import { ProgressObserver, EpisodeDataObserver, MessagesObserver } from './popup_observers.mjs';
import { Model } from './model.mjs';

/**
 * Extension
 */


class Extension {
  browser = null;
  activeTab = null;
  ctrlPort = null;
  dataPort = null;
  observers = { 'sendPrg':null, 'recvPrg': null, 'prgData':null, 'infoMsg': null };

  constructor(browser, tab) {
    this.browser = browser;
    this.activeTab = tab;

    // should clean up this orphaned event listener if it leaks mem
    this.browser.runtime.onConnectExternal.addListener(port => {
      console.log(this.constructor.name, 'onConnectExternal');
      this.dataPort = port;
      this.process();
    });

    // Send message to have the runner.mjs script connect to this extension
    this.ctrlPort = this.browser.tabs.connect(this.activeTab.id);
    this.ctrlPort.postMessage('connect');
    this.ctrlPort.disconnect();
  }



  async process() {
    this.observers.infoMsg?.update(`Starting`);

    const mod = new Model(this.dataPort);

    const toCheck = await mod.getWatchedData();
    const numEps = Object.keys(toCheck).length;
    // console.log('---------------', numEps);
    // console.dir(toCheck);
    // console.dir(Object.keys(toCheck));

    if (numEps) {
      this.observers.infoMsg?.update(`Processing ${numEps} result(s)`);
      this.observers.sendPrg?.update(0, numEps);
      this.observers.recvPrg?.update(0, numEps);

      await mod.processGetDetails(toCheck, numEps, this.observers);
    }
    else {
      this.observers.infoMsg?.update(`Nothing to process`);
    }

    this.observers.infoMsg?.update(`Completed`);
  }
}

// document.addEventListener('visibilitychange', ev => {
//   console.log('visibilitychange');
//   console.dir(ev);
// });



const browser = window.browser || window.chrome;
browser.tabs.query({ active: true, currentWindow: true })
.then(tabs => {
  const [tab] = tabs;
  const tabUrlMask = /rogers\.com/;

  if (!tab) throw 'Tab is null';
  if (!tabUrlMask.test(tab.url)) throw 'Not correct website!';
  if (tab.status !== 'complete') throw 'Site not finished loading!';

  const ext = new Extension(browser, tab);

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
