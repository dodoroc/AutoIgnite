// import { createApp, reactive } from 'https://unpkg.com/petite-vue?module';
import { createApp, reactive } from 'https://unpkg.com/petite-vue@0.4.1/dist/petite-vue.es.js?module';
import { result } from '/assets/result.mjs';
import { data } from '/assets/data.mjs';

// Return a function that returns a promise after a specified timeout
// used to hide the loading spinner. Will always resolve after a timeout >= 0ms.
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
    if (ev.target.name === 'filter-textual') {
      clearTimeout(this.textualDebounceId);
      this.textualDebounceId = setTimeout(this.onInput, 500, 'val');
    }
    else if (ev === 'val') {
      model.result.apply(model.params);
    }
  },

  onChanged(ev) {
    switch (ev.target.name) {
      case 'filter-seriesid':
        model.data.loadTracked(model.params.seriesId).then(() => {
          const series = model.data.series[model.params.seriesId];
          model.result.source = series.programs;
          model.result.apply(model.params);
        });
        break;

      case 'filter-unwatched':
      case 'sorted':
        model.result.apply(model.params);
        break;
      default: return;
    }
  },

  seep(str) {
    return str.replace(/^(\d{4})(\d{3})$/, '$1.$2')
    // if (str && str.length == 7) {
    //   return str.replace(/^(\d{4})(\d{3})$/, '$1.$2')
    // }
    // return str;
  },

  uncloak() {
    document.body.removeAttribute('cloak');
  },

  mounted() {
    after(1100).then(this.uncloak);
  },
});//.mount();



model.data.loadSeries().then(() => {
  const keys = Object.keys(model.data.series);
  if (keys.length) {

    const seriesId = keys[0];
    model.params.seriesId = seriesId;

    model.data.loadTracked(seriesId).then(() => {
      const series = model.data.series[model.params.seriesId];
      model.result.source = series.programs;
      model.result.apply(model.params);

      app.mount();
    });
  }
});

