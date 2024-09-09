import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

// const source = {};
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
    compile(ev) {

    },
    apply() {
      this.results = model.source.programs[model.source.seriesId];
    }
  },


});

const app = createApp({
  model,

  filterParamsChanged(ev) {
    console.log('[[ ----------------------------');
    console.dir(ev);
    console.log('---------------------------- ]]');

    model.filter.compile(ev);
    model.source.loadTracked().then(() => {
      model.filter.apply();
    });
  },

  show() {
    // const at = document.body.getAttribute('cloak');
    // if (at)
    document.body.removeAttribute('cloak');
  },

  mounted() {
    console.log('mounted called');

    const t = -Date.now()
    const sleep = ms => new Promise(r => setTimeout(r, ms));

    model.filter.compile();
    model.source.loadSeries().then(() => {
      model.source.loadTracked().then(() => {
        model.filter.apply();
        const rem = Math.max(0, 2000 - Date.now() + t);
        sleep(2000).then(this.show);

      });
    });
  },
}).mount();
// setTimeout(() => {app.mount()}, 4000);

