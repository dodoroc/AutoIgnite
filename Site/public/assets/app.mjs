// import { createApp, reactive } from 'https://unpkg.com/petite-vue?module';
import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module';
import { result } from '/assets/result.mjs';
import { data } from '/assets/data.mjs';

// Return a function that returns a promise after a specified timeout
// used to hide the loading spinner. Always resolves & timeout >= 0ms.
const after = (start_ms => {
  return delta_ms => {
    const ms = Math.max(0, delta_ms - (Date.now() - start_ms));
    return new Promise(r => setTimeout(r, ms));
  };
})(Date.now());


const model = reactive({
  result,
  data,

  params: {
    seriesId: null,
    unwatched: false,
    textual: '',
    sort: 'un',
  },
});


const app = createApp({
  model,

  textualDebounceId: 0,
  onInput(ev) {
    if (ev === 'use-val') {
      model.result.filter(model.params);
    }
    else if (ev.target.name === 'filter-textual') {
      clearTimeout(this.textualDebounceId);
      this.textualDebounceId = setTimeout(this.onInput, 500, 'use-val');
    }
  },

  onChanged(ev) {
    switch (ev.target.name) {
      case 'filter-seriesid':
        model.data.loadTracked(model.params.seriesId).then(() => {
          const series = model.data.series[model.params.seriesId];
          model.result.source = series.programs;
          model.result.filter(model.params);
        });
        break;

      case 'filter-unwatched':
      case 'sorted':
        model.result.filter(model.params);
        break;
      default: return;
    }
  },

  seep(str) {
    // return str.replace(/^(\d{4})(\d{3})$/, '$1.$2');
    return str.replace(/(?|(000)([1-9])|(00)([1-9]\d)|(0)([1-9]\d\d)|()([1-9]\d\d\d))(?|(00)([1-9])|(0)([1-9]\d)|()([1-9]\d\d))/, '$1<i>$2</i>.$3<i>$4</i>');
  },

  mounted() {
    const uncloak = () => void document.body.removeAttribute('cloak');
    after(1100).then(uncloak);
  },
});



model.data.loadSeries().then(() => {
  const keys = Object.keys(model.data.series);
  if (keys.length) {

    const seriesId = keys[0];
    model.params.seriesId = seriesId;

    model.data.loadTracked(seriesId).then(() => {
      const series = model.data.series[model.params.seriesId];
      model.result.source = series.programs;
      model.result.filter(model.params);

      app.mount();
    });
  }
});

