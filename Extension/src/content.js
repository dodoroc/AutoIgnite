/**
 * This script (content.js) is added via the manifest and installs the script (runner.mjs) that performs the work.
 * Content scripts have restricted access to the page they are injected into, whereas the installed scripts do not.
 * Updating dataset.state with a message packet received from the extension (popup.mjs) which is processed by a
 * mutation observer (runner.mjs) that watches the script tag (src=content.js). The observer connects to the
 * extension (popup.mjs) and sends the results.
 *
 */

window.browser = window.browser || window.chrome;

(() => {
  function appendPayloadScript(extId, name) {
    const script = document.createElement('script');
    script.src = browser.runtime.getURL(`${name}?id=${extId}`);
    script.type = 'module';
    script.id = extId;
    script.dataset.state = 'nop';
    document.head.append(script);
    return script;
  }

  function removePayloadScript(extId) {
    const script = document.head.querySelector(`script[id=${extId}]`);
    script?.remove();
  }

  function isPayloadScriptInstalled(extId) {
    return !!document.head.querySelector(`#${extId}`);
  }

  function delay(durInMin, onExpired, extId) {
    const msPerMin = 6e5;
    let tmr = 0;
    clearTimeout(tmr);
    tmr = setTimeout(onExpired, durInMin*msPerMin, extId);
  }

  function setup() {
    console.log('content.js in setup');

    const extId = browser.runtime.id;
    let scriptObj = null;

    const handleMsg = message => {
      console.log('content.js onMessage handler: ' +message);

      scriptObj.dataset.state = message;
      // delay(2, removePayloadScript, extId);
    };

    if (!isPayloadScriptInstalled(extId)) {
      scriptObj = appendPayloadScript(extId, '/task/runner.mjs');
      // delay(6, removePayloadScript, extId);
      delay(0.2, removePayloadScript, extId);
    }

    // Receive messages from extension
    browser.runtime.onConnect.addListener(port => {
      console.log('content.js onConnect');

      port.onMessage.addListener(handleMsg);
    });
  }

  try {
    setup();
  } catch (err) {
    // suppress errors for prod
    // console.log(err);
  }
})();