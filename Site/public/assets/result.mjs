// let values = [];
let zz = 42;

export default {
  values: [],

  get values() {
    return this.values;
  },
  set values(v) {
    this.values = v;
  },

  set source(src) {
    // this.values = src;
    this.values = src;
  },

  get length() {
    console.log(zz, this.zz, globalThis.zz, window.zz, self.zz);
    // return this.values.length;
    return this.values.length;
  },
}