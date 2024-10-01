
export result {
  values: [],
/*
  get values() {
    return this.values;
  },
  set values(v) {
    this.values = v;
  },
*/
  set source(src) {
    this.values = src;
  },

  get length() {
    return this.values.length;
  },
}