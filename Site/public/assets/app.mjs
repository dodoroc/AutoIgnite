import { createApp, reactive } from 'https://unpkg.com/petite-vue?module'

const store = reactive({
  series: [],
  selectedNdx: 0,
  programs: null,
});

async function loadSeries() {
  return fetch('http://192.168.50.200:9080/series')
  .then(data => data.json());
}
// manipulate it here
// store.inc()
function seriesChanged(itm) {
  console.dir(itm);
}
createApp({
  // share it with app scopes
  store
}).mount();
store.series = await loadSeries();
