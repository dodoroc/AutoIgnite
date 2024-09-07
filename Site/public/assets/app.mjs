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
  #selectedSeriesId: null,
  set selectedSeriesId(v) {
    this.#selectedSeriesId = v;
  }
  get selectedSeriesId() {
    this.#selectedSeriesId;
  }
  programs: [],
  filtered: [],

  loadSeries() {
    console.log('loadSeries called');

    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        sel();
        this.series = json;
        this.selectedSeriesId = this.series[0].seriesId;
        document.querySelector('select').value = this.series[0].seriesId;
        setTimeout(sel, 2000);
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
  test(p) {
    console.log('test');
    console.dir(p);
  },
  mounted() {
    console.log('mounted called');
    store.loadSeries();
  }
}).mount();

