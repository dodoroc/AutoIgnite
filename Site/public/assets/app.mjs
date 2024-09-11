import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module';//https://unpkg.com/petite-vue?module'

const appStart_ms = Date.now();

const model = reactive({
  source: {
    series: [],
    seriesId: '',
    programs: {},

    loadSeries() {
      console.log('loadSeries called');

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
      console.log('loadPrograms called', this.seriesId);

      if (this.programs[this.seriesId] && Array.isArray(this.programs[this.seriesId])) {
        return Promise.resolve();
      }

      return fetch(`http://192.168.50.200:9080/series/${this.seriesId}/tracked`)
      .then(data => data.json())
      .then(json => {
        if (Array.isArray(json)) {
          this.programs[this.seriesId] = json;
        }
      });
    },
  },

  filter: {
    results: [],
    params: {
      name: '',
      unwatched: false,
    },
    actions: [],
    act_unwatched: arr => Array.prototype.filter.bind(arr, o => !o.watchedOn),
    act_name: arr => Array.prototype.filter.bind(arr, o => o.name.includes(this.params.name)),
    compile() {
      this.actions = [];
      if (this.params.unwatched) this.actions.push(this.act_unwatched);
      if (this.params.name.length) this.actions.push(this.act_name);
      //nextTick(() => {
      // Promise.resolve().then(() => {
        console.log(this.params.name);
        console.log(this.params.unwatched);
      // });
    },
    apply() {
      let res = model.source.programs[model.source.seriesId];

      // if (this.actions.length) res = this.actions[0](res);
      // console.dir(this.actions);
      const f = arr => Array.prototype.filter.bind(arr, o => !!!o.watchedOn);
      res = f(res)();

      for (const fnc in this.actions) {
        // console.dir(fnc);
        // res = fnc(res)();
      }

      this.results =res;
    }
  },


});

const app = createApp({
  model,

  changedDebounceId: 0,
  filterParamsChanged(ev) {
    console.dir(ev);
    if (ev) console.log('[[', ev.type, ev.target.type, ev.target.value);
    // return;

    // ev.type -> input, select, checkbox
    switch (true) {
      case (ev == null): /* explicit == */
      case (ev.type === 'change' && ev.target.name === 'filter-seriesid'):
      case (ev.type === 'change' && ev.target.name === 'filter-unwatched'):
        model.filter.compile(ev);
        model.source.loadTracked().then(() => {
          model.filter.apply();
        });
      break;

      case (ev.type === 'input' && ev.target.name === 'filter-name'):
        clearTimeout(this.changedDebounceId);
        this.changedDebounceId = setTimeout(this.filterParamsChanged, 500);
      break;

      default:
        // alert('filterParamsChanged switch default should not be chosen');
        // console.error('filterParamsChanged switch default should not be chosen');
    }
  },

  seep(str) {
    if (str && str.length == 7) {
      return str.replace(/^(\d{4})(\d{3})$/, '$1.$2')
    }
    return str;
  },

  after(delta_ms) {
    const ms = Math.max(0, delta_ms - (Date.now() - appStart_ms));
    return new Promise(r => setTimeout(r, ms));
  },
  uncloak() {
    document.body.removeAttribute('cloak');
  },

  mounted() {
    console.log('mounted called');

    model.filter.compile();
    model.source.loadSeries().then(() => {
      model.source.loadTracked().then(() => {
        model.filter.apply();
        this.after(1100).then(this.uncloak);
      });
    });
  },
}).mount();

