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
    return req.fetch().then(data => {
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

function run() {
  const extId = new URL(import.meta.url).searchParams.get('id');

  const fetcher = DataFetchFactory.create();

  const callback = (mutations, observer) => {
    for (const mutation of mutations) {
      if (mutation.type === 'attributes' && mutation.attributeName === 'data-state') {
        const cmd = mutation.target.dataset.state;

        if (cmd === 'init') {
          fetcher.tokensFrom(localStorage);
          return;
        }

        fetcher.exec(cmd).then(res => {
          const port = browser.runtime.connect(extId);
          port.postMessage(res);
          port.disconnect();
        });
      }
    }
  };

  const observer = new MutationObserver(callback);
  const target = document.querySelector(`#${extId}`);
  observer.observe(target, { attributes: true }); //attributeOldValue: true,
}

try {
  run();
} catch (err) {
  // console.dir(err);
}