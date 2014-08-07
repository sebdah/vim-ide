'use strict';

var fs = require('fs')
  , path = require('path')
  , logger = require('./logger');

function backupVimFiles (callback) {
  var src = path.join(process.env.HOME, '.vimrc');
  var dst = path.join(process.env.HOME, '.vimrc');

  logger.log('info', 'Backing up %s to %s', src, dst);
  fs.rename(src, dst, function (err) {
    callback();
  });
}

module.exports = {
  vimFiles: backupVimFiles
};
