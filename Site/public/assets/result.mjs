var values = [];

export default {
  // values: [],

  get values() {
    return values;
  },
  set values(v) {
    values = v;
  },

  set source(src) {
    // this.values = src;
    values = src;
  },

  get length() {
    // return this.values.length;
    return values.length;
  },
}