export default {
  values: [],
  set source(src) {
    this.values = src;
  },
  get count() {
    return this.values.length;
  },
  get data() {
    return this.values;
  },
  set data(v) {
    this.values = v;
  },
  reset() {
    this.values = model.source.programs.current;
  },
}