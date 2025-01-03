export const Sorted = Object.freeze({
  UNSORTED: 'un',
  NAME:     'nm',
  SE_KEY:   'ky',
  AIRED:    'da',
  WATCHED:  'dw',
});

export const result = {
  programs: [],
  source_data: null,

  set source(src) {
    this.source_data = src;
  },

  get count() {
    return this.programs.length ?? 0;
  },

  process_filters(params, actions) {
    if (params.unwatched) actions.push(() => this.programs.filter(o => !o.watchedOn));

    if (params.textual.length) {
      try {
        const rex = new RegExp(params.textual, 'i');
        actions.push(() => this.programs.filter(o => rex.test(o.name)));
      } catch {}
    }
  },

  process_sort(params, actions) {
    let fnc = null;
    switch (params.sort) {
      // case 'un': fnc = null; break;
      case Sorted.NAME: fnc = (a,b) => a.name.localeCompare(b.name, 'ks-base'); break;
      case Sorted.SE_KEY: fnc = (a,b) => a.seepKey.localeCompare(b.seepKey, 'kn-true'); break;
      case Sorted.AIRED: fnc = (b,a) => a.airedOn?.localeCompare(b.airedOn, 'kn-true'); break;
      case Sorted.WATCHED: fnc = (a,b) => a.watchedOn?.localeCompare(b.watchedOn, 'kn-true'); break;
      default: return;
    }

    actions.push(() => this.programs.toSorted(fnc));
  },

  filter(params) {
    const actions = [];

    this.programs = [...this.source_data];
    this.process_filters(params, actions);
    this.process_sort(params, actions);

    for (const f of actions) {
      this.programs = f();
    }
  }
};