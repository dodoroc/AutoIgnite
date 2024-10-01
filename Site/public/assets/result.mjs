export default {
  values: [],
  set source(src) {
    this.values = src;
  },
  get length() {
    return this.values.length;
  },
}