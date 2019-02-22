'use strict';
module.exports = pandora => {
  pandora
    .fork('sandbox-app', require.resolve('midway/server'));
};
