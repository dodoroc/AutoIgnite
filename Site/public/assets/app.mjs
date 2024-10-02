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

/*
series: {
  '<id 19dig...0>': {
    ...series data
    programs: []
  }
}
*/
const model = reactive({
  result,
  data,

  params: {
    seriesId: null,
    unwatched: false,
    textual: '',
    sort: 'df',
  },


  source: {

    series: {
      activeId: '',
      values: {},
      // return object<series> or null
      get current() {
        if (this.activeId) {
          return this.values[this.activeId];
        }
        return null;
      },
    },

    programs: {
      values: {},
      // return array<tracked> or array<>
      get current() {
        if (model.source.series.activeId) {
          return this.values[model.source.series.activeId];
        }
        return [];
      },
      get length() {
        let len = 0;
        if (model.source.series.activeId) {
          len = this.values[model.source.series.activeId]?.length ?? 0;
        }
        return len;
      },
    },
  },

  filter: {
    params: {
      seriesId: '',
      name: '',
      unwatched: false,
    },
    actions: [],

    compile() {
      this.actions = [];

      // if (this.params.)

      if (this.params.unwatched) this.actions.push(o => !o.watchedOn);

      if (this.params.name.length) {
        try {
          const rex = new RegExp(this.params.name, 'i');
          this.actions.push(o => rex.test(o.name));
        } catch (err) {}
      }
    },

    apply() {
      for (const fnc of this.actions) {
        model.result.values = model.result.values.filter(fnc);
      }
    }
  },

  sort: {
    sort_fnc: null,
    params: {
      column: 'df',
    },

    compile() {
      switch (this.params.column) {
        default:
        case 'df': this.sort_fnc = null; break;
        case 'nm': this.sort_fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
        case 'ky': this.sort_fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
        case 'da': this.sort_fnc = (a,b) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
        case 'dw': this.sort_fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
      }
    },

    apply() {
      if (this.sort_fnc) {
        model.result.values.sort(model.sort.sort_fnc);
      }
    }
  },



});


/*
 name="sorted" value="df
 name="sorted" value="ky
 name="sorted" value="da
 name="sorted" value="dw
*/
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
    // console.dir(ev);
    // if (ev)console.log(`${ev.type}  n: ${ev.target.name}  v: ${ev.target.value} chk: ${ev.target.checked}`);
    // console.dir(model.source.programs.current[0]);
    // console.dir(model.result.values[0]);
    // ev.type -> input, select, checkbox
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
    model.data.loadSeries().then(() => {
      const keys = Object.keys(model.data.series);
      if (keys.length) {

        const seriesId = keys[0];
        model.params.seriesId = seriesId;

        model.data.loadTracked(seriesId).then(() => {
          const series = model.data.series[model.params.seriesId];
          model.result.source = series.programs;
          model.result.apply(model.params);

          after(1100).then(this.uncloak);
        });
      }
    });
  },
}).mount();

