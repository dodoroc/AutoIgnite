
export const result = {
  programs: [],
  source_data: null,
  count: {
    found: 0,
    filtered: 0,
  },

  set source(src) {
    this.source_data = src;
    this.count.found = src.length;
  },
  get found() { return this.count.found },
  get filtered() { return this.count.filtered },


  process_filters(params, actions) {
    if (params.unwatched) actions.push(() => this.programs.filter(o => !o.watchedOn));

    if (params.textual.length) {
      try {
        const rex = new RegExp(params.textual, 'i');
        actions.push(() => this.programs.filter(o => rex.test(o.name)));
      } catch (err) {}
    }
  },

  process_sort(params, actions) {
    let fnc = null;
    switch (params.sort) {
      // case 'un': fnc = null; break;
      case 'nm': fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
      case 'ky': fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
      case 'da': fnc = (b,a) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
      case 'dw': fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
      default: return;
    }

    actions.push(() => this.programs.toSorted(fnc));
  },

  apply(params) {
    const actions = [];

    this.programs = [...this.source_data];
    this.process_filters(params, actions);
    this.process_sort(params, actions);

    for (const f of actions) {
      this.programs = f();
    }

    this.count.filtered = this.programs.length;
  }
};