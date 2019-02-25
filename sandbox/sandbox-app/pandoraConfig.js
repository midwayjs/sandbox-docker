exports.components = {
  sandboxLogHubReporter: {
    path: './dist/pandora-component-sandbox-logger-hub-reporter/ComponentSandboxFileReporter.js'
  },
  autoPatching: {
    path: 'pandora-component-auto-patching'
  }
};

exports.sandboxLogHubReporter = {
  endpoint: 'http://127.0.0.1:7001/'
};

exports.trace = {
  sampling: 10
};

exports.autoPatching = {
  patchers: {
    global: {
      recordConsole: true,
      recordUnhandled: true,
      recordFatal: true
    }
  }
};
