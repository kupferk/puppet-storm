# Define: storm::service
#
# This module manages storm serviceation
#
# Parameters: None
#
# Actions: None
#
# Requires: storm::install
#
# Sample Usage: storm::service { 'nimbus':
#                 start => 'yes',
#                 jvm_memory => '1024m'
#               }
#
define storm::service($classname, $start = 'no', $jvm_memory = '768m', $respawn = true, $opts = []) {
  require storm::install

  file { "/etc/init/storm-${name}.conf":
    content => template('storm/init-service.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => File["/etc/default/storm-${name}"],
  }

  file { "/etc/default/storm-${name}":
    # require => Package['storm'],
    content => template('storm/default-service.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service["storm-${name}"],
  }

  service { "storm-${name}":
    ensure  => "running",
    enable  => "true",
    provider => "upstart",
    # require => Package["storm"],
  }

}
