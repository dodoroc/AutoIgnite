
export const result = {
  rows: [],
  source_data: null,

  set source(src) {
    this.source_data = src;
  },


  process_filters(params, actions) {
    if (params.unwatched) actions.push(() => this.rows.filter(o => !o.watchedOn));

    if (params.textual.length) {
      try {
        const rex = new RegExp(params.textual, 'i');
        actions.push();
        actions.push(() => this.rows.filter(o => rex.test(o.textual)));
      } catch (err) {}
    }
  },

  process_sort(params, actions) {
    let fnc = null;
    switch (params.sort) {
      // case 'df': fnc = null; break;
      case 'nm': fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
      case 'ky': fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
      case 'da': fnc = (a,b) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
      case 'dw': fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
      default: return;
    }

    actions.push(() => this.rows.toSorted(fnc));
  },

  apply(params) {
    const actions = [];

    this.rows = [...this.source_data];
    this.process_filters(params, actions);
    this.process_sort(params, actions);

    for (const f of actions) {
      this.rows = f();
    }
  }
};