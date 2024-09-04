import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

const store = reactive({
  series: null,
  selectedSeriesId: null,
  programs: null,

  loadSeries() {
    console.log('loadSeries called');
    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (json?.length) {
        this.series = json;
        this.selectedSeriesId = this.series[0].seriesId;
      }
    });
  },

  loadPrograms(seriesId) {
    console.log('loadPrograms called');
    programs = fetch(`http://192.168.50.200:9080/series/${seriesId}/watched-episodes`)
    .then(data => data.json());
  }
});

// manipulate it here
// store.inc()
const app = createApp({
  // share it with app scopes
  store,
  seriesChanged(ev) {
    console.dir(ev);
    console.dir(store.series);
    console.dir(store.series.length);
    console.dir(store.series[0]);

    console.log(store.selectedSeriesId);
  },

  init() {
    console.log('init');
  },
  setup() {
    console.log('setup');
    return {
    }
  },
  data() {
    console.log('data');
    return {
    }
  },
  mounted() {
    // store.loadSeries();
    // console.dir(store.selectedSeries);
    // console.dir(this.selectedValue);
  }
}).mount();

