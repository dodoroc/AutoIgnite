/**
 * GUI observer classes
 */

export class ProgressObserver {
  #progressEl = null;

  constructor(progressEl) {
    if (progressEl.constructor !== HTMLProgressElement) throw new TypeError;

    this.#progressEl = progressEl;
  }

  #progress(nth, max) {
    let fract = 0;

    if (max > 0) {
      this.#progressEl.value = nth;
      this.#progressEl.max = max;
      fract = nth / max;
    }

    this.#progressEl.style = `--fract: ${fract.toFixed(4)}`;
  }

  clear() {
    this.#progress(0, 0);
  }

  update(nth, max) {
    if (this.#progressEl) {
      this.#progress(nth, max);
    }
  }
}



export class EpisodeDataObserver {
  #tblBodyEl = null;
  #fields = null;

  constructor(tableEl, fields) {
    if (tableEl.constructor !== HTMLTableElement) throw new TypeError;

    tableEl.deleteCaption();
    tableEl.deleteTFoot();

    for (let i = 0; i < tableEl.tBodies.length; i++) {
      tableEl.tBodies[i].remove();
    }

    this.#tblBodyEl = tableEl.createTBody();
    this.#fields = fields;
  }

  #append(data) {
    const row = this.#tblBodyEl.insertRow();
    for (const f of this.#fields) {
      row.insertCell().textContent = data[f];
    }
  }

  clear() {
    this.#tblBodyEl.replaceChildren();
  }

  update(data) {
    if (data) {
      this.#append(data);
    }
  }
}



export class MessagesObserver {
  #listEl = null;

  constructor(listEl) {
    if (listEl.constructor !== HTMLUListElement) throw new TypeError;

    this.#listEl = listEl;
  }

  #append(msg, isWarning) {
    const li = document.createElement('li');
    li.textContent = msg;
    if (isWarning) {
      li.classList.add('warn');
    }

    this.#listEl.append(li);
  }

  clear() {
    this.#listEl.replaceChildren();
  }

  update(msg, isWarning = false) {
    if (msg) {
      this.#append(msg, isWarning);
    }
  }
}
