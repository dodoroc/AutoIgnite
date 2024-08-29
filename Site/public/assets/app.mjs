import { createApp, reactive } from 'https://unpkg.com/petite-vue?module'

const store = reactive({
  count: 0,
  inc() {
    this.count++
  }
})

// manipulate it here
store.inc()

createApp({
  // share it with app scopes
  store
}).mount()