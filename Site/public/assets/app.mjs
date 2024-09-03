import { createApp, reactive } from 'https://unpkg.com/petite-vue?module'

const store = reactive({
  series:
  [
    {
      "seriesId": "6774048176174390112",
      "name": "Ridiculousness",
      "releaseYear": "2011-",
      "seasonMin": 31,
      "seasonMax": 999
    }
  ],
  selectedNdx: 0,
  programs: null,
});

async function loadSeries() {
  return await fetch('http://192.168.50.200:9080/series')
  .then(data => store.series = data.json());
}
// manipulate it here
// store.inc()
function seriesChanged(itm) {
  console.dir(itm);
}
loadSeries();
createApp({
  // share it with app scopes
  store
}).mount();