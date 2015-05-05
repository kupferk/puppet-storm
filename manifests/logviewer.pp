# Class: storm::logviewer
#
# This module manages storm logviewer service
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: include storm::logviewer
#
class storm::logviewer inherits storm {
  require storm::install
  require storm::config

  # Install logviewer /etc/default
  storm::service { 'logviewer':
    start      => 'yes',
    classname  => 'backtype.storm.daemon.logviewer',
    jvm_memory => $storm::params::logviewer_mem,
  }

}

