'use strict';
module.exports = pandora => {
  pandora
    .fork('sandbox-app', 'midway/server');
};
