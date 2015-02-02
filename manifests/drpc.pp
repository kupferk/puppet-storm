# Class: storm::drpc
#
# This module manages storm drpc
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: include storm::drpc
#
class storm::drpc inherits storm {
  require storm::install

  # Install nimbus /etc/default
  storm::service { 'drpc':
    start      => 'yes',
    classname  => 'backtype.storm.daemon.drpc',
    jvm_memory => $storm::params::drpc_mem
  }

}

