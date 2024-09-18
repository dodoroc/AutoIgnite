// import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module';
import { createApp, reactive } from 'https://unpkg.com/petite-vue?module';

const appStart_ms = Date.now();

const model = reactive({
  source: {
    series: [],
    seriesId: '',
    programs: {},
    count: 0,

    loadSeries() {
      // console.log('loadSeries called');

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
      // console.log('loadPrograms called', this.seriesId);

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

  filter: {
    results: [],
    params: {
      name: '',
      unwatched: false,
    },
    actions: [],
    count: 0,

    compile() {
      this.actions = [];
      if (this.params.unwatched) this.actions.push(o => !o.watchedOn);
      // if (this.params.name.length) this.actions.push(o => o.name.includes(this.params.name));
      if (this.params.name.length) {
        try {
          const rex = new RegExp(this.params.name, 'i');
          // this.actions.push(o => -1 < o.name.search(rex));
          this.actions.push(o => rex.test(o.name));
        } catch (err) {}
      }
    },
    apply() {
      let res = model.source.programs[model.source.seriesId];

      for (const fnc of this.actions) {
        res = res.filter(fnc);
      }

      this.results = res;
      this.count = res.length;
    }
  },


});

const app = createApp({
  model,

  changedDebounceId: 0,
  filterParamsChanged(ev) {
    // if (ev) console.log('[[', ev.type, ev.target.type, ev.target.value);
    // if (ev) console.dir(ev);
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

  after(delta_ms, start_ms) {
    const ms = Math.max(0, delta_ms - (Date.now() - start_ms));
    return new Promise(r => setTimeout(r, ms));
  },
  uncloak() {
    document.body.removeAttribute('cloak');
  },

  mounted() {
    model.filter.compile();
    model.source.loadSeries().then(() => {
      model.source.loadTracked().then(() => {
        model.filter.apply();
        this.after(1100, appStart_ms).then(this.uncloak);
      });
    });
  },
}).mount();

