import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module'//https://unpkg.com/petite-vue?module'

const store = reactive({
  series: null,
  selectedSeries: null,
  programs: null,
  loadSeries() {
    fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => this.series = json);
  },
  loadPrograms(seriesId) {
    programs = fetch(`http://192.168.50.200:9080/series/${seriesId}/watched-episodes`)
    .then(data => data.json());
  }
});

async function loadSeries() {
  return
}
// manipulate it here
// store.inc()
const app = createApp({
  // share it with app scopes
  store,
  selectedValue: null,
  seriesChanged(ev) {
    console.dir(ev);
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

