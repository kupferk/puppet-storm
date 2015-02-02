# Class: storm::ui
#
# This module manages storm ui
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: include storm::ui
#
class storm::ui inherits storm {
  require storm::install
  require storm::config

  # Install nimbus /etc/default
  storm::service { 'ui':
    start      => 'yes',
    classname  => 'backtype.storm.ui.core',
    jvm_memory => $storm::params::ui_mem
  }

}

