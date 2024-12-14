window.browser = window.browser || window.chrome;

import * as actions from '/task/actions.mjs';

class DataFetchFactory {
  static {
    this.tokens = {};
  }

  static create() {
    return this;
  }

  static tokensFrom(src) {
    this.tokens.xsct = src.getItem('tv-xsct');
    this.tokens.acct = JSON.parse(src.getItem('tv-tokens-acc'))[0];
    this.tokens.feat = JSON.parse(src.getItem(`tv-features-${this.tokens.acct}`)).featuresToken;
  }

  static #getWatchedPrograms(req) {
    return req.fetch()
    .then(data => {
      return data._embedded.watchedPrograms.reduce((obj, item) => {
        obj[item.programId] = {
          'programId': item.programId,
          'watchedOn': new Date(item.dateWatched).toISOString().slice(0, 10),
        }
        return obj;
      }, {});
    });
  }

  static #getProgramEntity(req) {
    return req.fetch().then(data => {
      if (data?.programId) {

        const ep = {
          'programId': data.programId,
          'type': data._type ?? '',
          'name': data.name ?? '',
          'airedOn': null,
          'season': 0,
          'seriesId': '',
        };

        const ts = parseInt(data.datePublishedMs, 10);
        if (!isNaN(ts)) {
          ep.airedOn = (new Date(ts)).toISOString().slice(0, 10);
        }

        if (ep.type.startsWith('s:')) {
          ep.type = ep.type.slice(2);
        }

        if (ep.type === 'TVEpisode') {
          ep.seriesId = data._links.partOfTvSeries?.href.slice(-20,-1);
          ep.season = data.partOfSeason?.seasonNumber ?? 0;
        }

        return ep;
      }

      return null;
    });
  }

  // the exresult from the custom fetch request
  static exec(cmd) {
    const [fnc, p1, p2, p3] = [...cmd.split('|'), null, null, null];
    const tok = this.tokens;

    try {
      switch (fnc) {
        case 'getWatchedPrograms': {
          const req = new actions.getWatchedPrograms(tok.xsct, tok.feat);
          return this.#getWatchedPrograms(req);
        }

        case 'getProgramEntity': {
          // p1 parmeter contains the required programId
          const req = new actions.getProgramEntity(tok.xsct, tok.feat, p1);
          return this.#getProgramEntity(req);
        }
      }
    }
    catch (err) {
      // consider dealing with 404 so we don't recheck repeatedly
      // 403 with alert to refresh or re-login
      console.dir(err);
    }

    return null;
  }
}

class Runner {
  #extId = null;
  #port = null;
  #fetcher = null;

  #onMessage = cmd => {
    // console.log('on message (runner)', cmd);
    this.#fetcher.exec(cmd).then(res => {
      this.#port.postMessage(res);
    });
  };

  #onDisconnect = port => {
    this.#port = null;
  };

  reset() {
    try {
      if (this.#port) {
        this.#port?.onDisconnect.removeListener(this.#onDisconnect);
        this.#port?.onMessage.removeListener(this.#onMessage);
        this.#port?.disconnect();
        this.#port = null;
      }
    }
    catch (err) {
      console.dir(err);
    }
  }

  connect() {
    try {
      if (!this.#port) {
        this.#fetcher.tokensFrom(window.localStorage);

        this.#port = chrome.runtime.connect(this.#extId);
        this.#port.onDisconnect.addListener(this.#onDisconnect);
        this.#port.onMessage.addListener(this.#onMessage);
        // this.#port.postMessage('a msg');

      }
    }
    catch (err) {
      console.dir(err);
    }
  }


  constructor() {
    this.#extId = new URL(import.meta.url).searchParams.get('id');
    this.#fetcher = DataFetchFactory.create();
  }
}

try {
  const r = new Runner;
  window.addEventListener('message', ev => {
    if (ev.data === 'connect') {
      // console.log('Runner message', ev.data);
      r.reset();
      r.connect();
    }
  });

}
catch (err) {
  // suppress errors for prod
  // console.log('Runner', err);
}
