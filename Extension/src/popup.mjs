// import { getDataCheckedTask, putDataWatchedTask, getDataToCheckTask, getDataEpisodesTask, } from './requests.mjs';

import { ProgressObserver, EpisodeDataObserver, MessagesObserver } from './popup_observers.mjs';
import { Model } from './model.mjs';

/**
 * Extension
 */


class Extension {
  browser = null;
  activeTab = null;
  observers = { 'sendPrg':null, 'recvPrg': null, 'prgData':null, 'infoMsg': null };

  constructor(browser, tab) {
    this.browser = browser;
    this.activeTab = tab;

    // should clean up this orphaned event listener if it leaks mem
    this.browser.runtime.onConnectExternal.addListener(port => {
      console.log(this.constructor.name, 'onConnectExternal', port?.name);
      this.process(port);
    });

    // this.requestConnection();
    setTimeout(() => this.requestConnection(), 3000);
  }

  // Send message to have the runner.mjs script connect to this extension
  requestConnection() {
    const port = this.browser.tabs.connect(this.activeTab.id);
    port.postMessage('connect');
    port.disconnect();
  }



  async process(port) {
    this.observers.infoMsg?.update(`Starting`);

    const mod = new Model(port);

    const toCheck = await mod.getWatchedData();
    const numEps = Object.keys(toCheck).length;
    // console.log('---------------', numEps);
    // console.dir(toCheck);
    // console.dir(Object.keys(toCheck));

    if (numEps) {
      this.observers.infoMsg?.update(`Processing ${numEps} result(s)`);
      this.observers.sendPrg?.update(0, numEps);
      this.observers.recvPrg?.update(0, numEps);

      await mod.updateDetailsForWatched(toCheck, numEps, this.observers);
    }
    else {
      this.observers.infoMsg?.update(`Nothing to process`);
    }

    // const res = await mod.searchByTerm('Sterling and Nina Agdal');
    const seriesId = '6774048176174390112'; //ridic
    // const seriesId = '8263471060961978112'; //ncis org
    const p1 = mod.getUpcomingListingsBySeriesId(seriesId);
    const p2 = mod.getUnwatchedTitlesBySeriesId(seriesId);
    const [r1, r2] = await Promise.allSettled([p1, p2]);
    const upcoming = r1.value;
    const unwatched = r2.value;
    console.dir(upcoming);
    console.dir(unwatched);

    if (seriesId === '6774048176174390112') {
      for (let i = 0; i < upcoming.length; i++) {
        if (upcoming[i].partOfSeason?.seasonNumber > 30) {
          console.log(upcoming[i]?.partOfSeason.seasonNumber, upcoming[i].name);
        }
      }
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
