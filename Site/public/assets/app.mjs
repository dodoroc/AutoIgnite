import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

const store = reactive({
  series: null,
  selectedSeries: null,
  programs: null,
});

async function loadSeries() {
  return fetch('http://192.168.50.200:9080/series')
  .then(data => data.json());
}
// manipulate it here
// store.inc()
createApp({
  // share it with app scopes
  store,
  seriesChanged(itm) {
    console.dir(itm);
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
  }
}).mount();
store.series = await loadSeries();

