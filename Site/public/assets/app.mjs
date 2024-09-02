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
  temp:0,
  t2:0
});

// manipulate it here
// store.inc()

createApp({
  // share it with app scopes
  store
}).mount();