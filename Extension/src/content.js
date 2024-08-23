/**
 * Content script is added via the manifest and installs the script that performs the work.
 * Since content scripts do not have access to js we need a native to the page script. Secondly
 * we update dataset.state with current milliseconds to trigger a mutation so that the runner.mjs
 * initiates a connection back the extension. We need to do since the connection is lost each
 * time the extension popup is closed; also connections to actual web pages from scripts is
 * not allowed per spec.
 *
 */

window.browser = window.browser || window.chrome;

(() => {
  function appendPayloadScript(id, name) {
    const script = document.createElement('script');
    script.src = browser.runtime.getURL(`${name}?id=${id}`);
    script.type = 'module';
    script.id = id;
    script.dataset.state = 'nop';
    document.head.append(script);
    return script;
  }

  function removePayloadScript(id) {
    const script = document.head.querySelector(`script[id=${id}]`);
    script?.remove();
  }

  function isPayloadScriptInstalled(id) {
    return !!document.head.querySelector(`#${id}`);
  }

  function delay(durInMin, onExpired, id) {
    const msPerMin = 6e5;
    let tmr = 0;
    clearTimeout(tmr);
    tmr = setTimeout(onExpired, durInMin*msPerMin, id);
  }

  function run() {
    const id = browser.runtime.id;
    let scriptObj = null;

    const handleMsg = message => {
      if (message === 'reset') {
        if (isPayloadScriptInstalled()) {
          removePayloadScript(id);
          scriptObj = appendPayloadScript(id, '/task/runner.mjs');
          delay(6, removePayloadScript, id);
        }
        return;
      }

      scriptObj.dataset.state = message;
      delay(2, removePayloadScript, id);
    };

    if (!isPayloadScriptInstalled(id)) {
      scriptObj = appendPayloadScript(id, '/task/runner.mjs');
      delay(6, removePayloadScript, id);
    }


    browser.runtime.onConnect.addListener(port => {
      port.onMessage.addListener(handleMsg);
    });
  }

  try {
    run();
  } catch (err) {
    // suppress errors for prod
    // console.log(err);
  }
})();