// import { createApp, reactive } from 'https://unpkg.com/petite-vue?module';
import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module';


// Return a function that returns a promise after a specified timeout
// used to hide the loading spinner. Will always resolve after a timeout >= 0ms.
const after = (start_ms => {
  return delta_ms => {
    const ms = Math.max(0, delta_ms - (Date.now() - start_ms));
    return new Promise(r => setTimeout(r, ms));
  };
})(Date.now());


const model = reactive({
  source: {
    series: [],
    seriesId: '',
    programs: {},
    count: 0,

    loadSeries() {
      return fetch(`http://192.168.50.200:9080/series`)
      .then(data => data.json())
      .then(json => {
        if (Array.isArray(json)) {
          this.series = json;
          this.seriesId = this.series?.length ? this.series[0].seriesId : '';
        }
      });
    },

    loadTracked() {
      if (this.programs[this.seriesId] && Array.isArray(this.programs[this.seriesId])) {
        return Promise.resolve();
      }

      return fetch(`http://192.168.50.200:9080/series/${this.seriesId}/tracked`)
      .then(data => data.json())
      .then(json => {
        if (Array.isArray(json)) {
          this.programs[this.seriesId] = json;
          this.count = json.length;
        }
      });
    },
  },

  result: {
    values: [],
    count: 0,
  },

  filter: {
    params: {
      name: '',
      unwatched: false,
    },
    actions: [],

    compile() {
      this.actions = [];

      if (this.params.unwatched) this.actions.push(o => !o.watchedOn);

      if (this.params.name.length) {
        try {
          const rex = new RegExp(this.params.name, 'i');
          this.actions.push(o => rex.test(o.name));
        } catch (err) {}
      }
    },

    apply() {
      let res = model.source.programs[model.source.seriesId];

      for (const fnc of this.actions) {
        res = res.filter(fnc);
      }

      model.result.values = res;
      model.result.count = res.length;
    }
  },

  sort: {
    // sort_fnc: () => 0,
    sort_fnc: null,
    params: {
      column: 'df',
    },

    compile() {
      switch (this.params.column) {
        default:
        case 'df': this.sort_fnc = (a,b) => 0; break;
        case 'nm': this.sort_fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
        case 'ky': this.sort_fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
        case 'da': this.sort_fnc = (a,b) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
        case 'dw': this.sort_fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
      }
    },

    apply() {
      model.result.values.sort(model.sort.sort_fnc);
    }
  },



});


/*
 name="sorted" value="df
 name="sorted" value="ky
 name="sorted" value="da
 name="sorted" value="dw
*/
const app = createApp({
  model,

  changedDebounceId: 0,
  filterParamsChanged(ev) {

    // ev.type -> input, select, checkbox
    switch (true) {
      case (ev == null): /* explicit == */
      case (ev.type === 'change' && ev.target.name === 'filter-seriesid'):
      case (ev.type === 'change' && ev.target.name === 'filter-unwatched'):
        model.filter.compile(ev);
        break;
      case (ev.type === 'change' && ev.target.name === 'sorted'):
        model.sort.compile(ev);
        break;

      case (ev.type === 'input' && ev.target.name === 'filter-name'):
        clearTimeout(this.changedDebounceId);
        this.changedDebounceId = setTimeout(this.filterParamsChanged, 500);
      break;

      default: return;
    }

    model.source.loadTracked().then(() => {
      model.filter.apply();
      model.sort.apply();
    });
  },

  seep(str) {
    return str.replace(/^(\d{4})(\d{3})$/, '$1.$2')
    // if (str && str.length == 7) {
    //   return str.replace(/^(\d{4})(\d{3})$/, '$1.$2')
    // }
    // return str;
  },

  uncloak() {
    document.body.removeAttribute('cloak');
  },

  mounted() {
    model.filter.compile();
    model.sort.compile();
    model.source.loadSeries().then(() => {
      model.source.loadTracked().then(() => {
        model.filter.apply();
        model.sort.apply();
        after(1100).then(this.uncloak);
      });
    });
  },
}).mount();

