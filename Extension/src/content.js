/**
 * This script (content.js) is added via the manifest and installs the script (runner.mjs) that performs the work.
 * Content scripts do not have access to js of the page they are injected in to, whereas the installed does.
 * Updating dataset.state with a message packet from current milliseconds to trigger a mutation so that the runner.mjs
 * initiates a connection back the extension. We need to do since the connection is lost each
 * time the extension popup is closed; also connections to actual web pages from scripts is
 * not allowed per spec.
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

      if (message === 'reset') {
        if (isPayloadScriptInstalled()) {
          removePayloadScript(extId);
          scriptObj = appendPayloadScript(extId, '/task/runner.mjs');
          delay(6, removePayloadScript, extId);
        }
        return;
      }

      scriptObj.dataset.state = message;
      // delay(2, removePayloadScript, extId);
    };

    if (!isPayloadScriptInstalled(extId)) {
      scriptObj = appendPayloadScript(extId, '/task/runner.mjs');
      // delay(6, removePayloadScript, extId);
    }

    // Receive messages from extension
    browser.runtime.onConnect.addListener(port => {
      console.log('content.js onConnect');

      port.onMessage.addListener(handleMsg);
    });
  }

  try {
    console.log('content.js pre setup');
    setup();
  } catch (err) {
    // suppress errors for prod
    // console.log(err);
  }
})();