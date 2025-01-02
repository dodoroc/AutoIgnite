/**
 * Relay messages from extension to sieged window via window.postMessage. Currently only function is to
 * tell the Runner class connect externally to the extension since connections close at random times.
 *
 */

class Broker {
  #browser = null;
  #extId = null;

  constructor(browser) {
    this.#browser = browser;
    this.#extId = this.#browser.runtime.id;
  }

  mediate() {
    if (!this.isPayloadScriptInstalled()) {
      this.appendPayloadScript('/task/runner.mjs');

      // Receive messages from extension and relay
      this.#browser.runtime.onConnect.addListener(port => {
        port.onMessage.addListener(msg => {
          // console.log('Broker onMessage', msg);
          // scriptObj.dataset.state = msg;
          window.top.postMessage(msg);
        });
      });

    }
  }

  appendPayloadScript(name) {
    const script = document.createElement('script');
    script.src = this.#browser.runtime.getURL(`${name}?id=${this.#extId}`);
    script.type = 'module';
    script.id = this.#extId;
    // script.dataset.state = 'nop';
    document.head.append(script);
    return script;
  }

  removePayloadScript() {
    const script = document.head.querySelector(`script[id=${this.#extId}]`);
    script?.remove();
  }

  isPayloadScriptInstalled() {
    return !!document.head.querySelector(`#${this.#extId}`);
  }

}

try {
  const browser = window.browser || window.chrome;
  (new Broker(browser)).mediate();
}
catch (err) {
  // suppress errors for prod
  // console.log('Broker', err);
}
