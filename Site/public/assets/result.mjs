let zz = 42;
export default {
  values: [],

  set source(src) {
    this.values = src;
  },

  get length() {
    return this.values.length;
  },

  test() {
    console.log(this.zz, self.zz, globalThis.zz, zz);
  }
}