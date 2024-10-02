
export const result = {
  rows: [],
  source: null,

  set source(src) {
    this.source = src;
  },



/*

  params: {
    seriesId: null,
    unwatched: false,
    textual: '',
    sort: 'df',
  },
*/
  process_filters(params, actions) {
    if (params.unwatched) actions.push(o => !o.watchedOn);

    if (params.textual.length) {
      try {
        const rex = new RegExp(params.textual, 'i');
        actions.push(o => rex.test(o.textual));
      } catch (err) {}
    }
  },

  process_sort(params, actions) {
    let fnc = null;
    switch (this.params.sort) {
      default:
      case 'df': fnc = null; break;
      case 'nm': fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
      case 'ky': fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
      case 'da': fnc = (a,b) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
      case 'dw': fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
    }

  },

  apply(params) {
    const actions = [];

    this.rows = [...this.source];
    this.process_filters(params, actions);
    this.process_sort(params, actions);



  }



    compile() {
      this.actions = [];

      // if (this.params.)
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




};