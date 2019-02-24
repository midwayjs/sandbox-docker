'use strict';
module.exports = pandora => {
  pandora
    .fork('test-app', './testServer.js');
};
