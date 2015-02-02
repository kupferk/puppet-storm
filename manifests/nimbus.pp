# Class: storm::nimbus
#
# This module manages storm nimbusation
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: include storm::nimbus
#
class storm::nimbus inherits storm {
  require storm::install

  # Install nimbus /etc/default
  storm::service { 'nimbus':
    start      => 'yes',
    classname  => 'backtype.storm.daemon.nimbus',
    jvm_memory => $storm::params::nimbus_mem
  }

}

