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

const model = reactive({
  series: [],
  seriesId: '',
  programs: {},
  filtered: [],

  filters: {
    name: '',
    unwatched: false,
  },

  loadSeries() {
    console.log('loadSeries called');

    return fetch(`http://192.168.50.200:9080/series`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.series = json;
        this.seriesId = this.series?.length ? this.series[0].seriesId : '';
      }
    });
  },

  loadTracked() {
    console.log('loadPrograms called', this.seriesId);

    if (this.programs[this.seriesId] && Array.isArray(this.programs[this.seriesId])) {
      this.filtered = this.filter();
      return;
    }

    fetch(`http://192.168.50.200:9080/series/${this.seriesId}/tracked`)
    .then(data => data.json())
    .then(json => {
      if (Array.isArray(json)) {
        this.programs[this.seriesId] = json;
        this.filtered = this.filter();
      }
    });
  },

  filtersChanged(ev) {
    console.log('[[ ----------------------------');
    console.dir(ev);
    console.log('---------------------------- ]]');
    this.filtered = this.filter();

  },
});

const app = createApp({
  model,

  mounted() {
    console.log('mounted called');
    model.loadSeries().then(() => {
      model.loadTracked();
    });
  }
}).mount();

