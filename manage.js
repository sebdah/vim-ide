#!/usr/bin/env node
'use strict';

var backup = require('./lib/backup')
  , logger = require('./lib/logger');

logger.info('Installing ');
backup.vimFiles(function () {
  logger.debug('Done');
});
