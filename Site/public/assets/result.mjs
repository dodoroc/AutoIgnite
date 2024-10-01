let values = [];

export default {
  values: [],

  set source(src) {
    // this.values = src;
    values = src;
  },

  get length() {
    // return this.values.length;
    return values.length;
  },
}