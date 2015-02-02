# Class: storm::supervisor
#
# This module manages storm supervisor
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: include storm::supervisor
#
class storm::supervisor inherits storm {
  require storm::install

  # Install nimbus /etc/default
  storm::service { 'supervisor':
    start      => 'yes',
    classname  => 'backtype.storm.daemon.supervisor',
    jvm_memory => $storm::params::supervisor_mem
  }

}

