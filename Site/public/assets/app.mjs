import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

function sel() {
  const el = document.querySelector('select');
  console.log('sel val',
    new String(el.value),
    new String(el.selectedIndex),
    // el.options[el.selectedIndex].textContent,
    // el.selectedOptions[0].value
  );
  console.dir(el);
}

const store = reactive({
  series: [],
  seriesId: '',
  set selectedSeriesId(v) {
    this.seriesId = v;
    console.log('set', this.seriesId);
  },
  get selectedSeriesId() {
    return this.seriesId;
    console.log('get', this.seriesId);
  },
  programs: [],
  filtered: [],
  filter: {
    name: '',
    unwatched: false,
  },

  loadSeries() {
    console.log('loadSeries called');

    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.series = json;
        this.seriesId = this.series?.length ? this.series[0].seriesId : '';
      }
    });
  },

  loadTracked(el) {
    console.log('loadPrograms called', this.seriesId);
    // if (this.seriesId) return;

    fetch(`http://192.168.50.200:9080/series/${this.seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.programs = json;
        this.filtered = this.programs.slice();
      }
    });
  },

  paramsChanged(ev) {
    console.log('[[ ----------------------------');
    console.dir(ev);
    console.log('---------------------------- ]]');
  },
});

// manipulate it here
// store.inc()
const app = createApp({
  // share it with app scopes
  store,

  mounted() {
    console.log('mounted called');
    store.loadSeries();
  }
}).mount();

