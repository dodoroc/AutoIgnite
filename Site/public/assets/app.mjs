import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

const store = reactive({
  series: [],
  selectedSeriesId: null,
  programs: [],
  filtered: [],

  loadSeries() {
    console.log('loadSeries called');

    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.series = json;
        this.selectedSeriesId = this.series[0].seriesId;
        console.log($el);
      }
    });
  },

  loadTracked(seriesId) {
    console.log('loadPrograms called', seriesId);
// this.programs = null;
    if (!seriesId) return;
    fetch(`http://192.168.50.200:9080/series/${seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.programs = json;
        console.dir(json);
      }
    });
  }
});

// manipulate it here
// store.inc()
const app = createApp({
  // share it with app scopes
  store,
  seriesChanged(ev) {
    console.log('[[ ----------------------------');
    console.dir(ev);
    console.dir(store.series);
    console.dir(store.series.length);
    console.dir(store.series[0]);
    console.log(store.selectedSeriesId);
    console.log('---------------------------- ]]');
  },
  test() {
    console.log('test');
  },
  mounted() {
    console.log('mounted called');
    this.store.loadSeries();
  }
}).mount();

