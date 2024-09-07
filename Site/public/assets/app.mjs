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
    this.seriesId;
    console.log('get', this.seriesId);
  },
  programs: [],
  filtered: [],

  loadSeries() {
    console.log('loadSeries called');

    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.series = json;
        if (this.series.length) {
          this.seriesId = this.series[0].seriesId;
        }
      }
    });
  },

  loadTracked(el) {
    console.log('loadPrograms called', this.seriesId);
    if (this.seriesId == el.value) return;

    fetch(`http://192.168.50.200:9080/series/${this.seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.programs = json;
        this.filtered = this.programs;
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
  test(p1, p2, p3) {
    console.log('test');
    console.dir(p1);
    console.dir(p2);
    console.dir(p3);
  },
  mounted() {
    console.log('mounted called');
    store.loadSeries();
  }
}).mount();

