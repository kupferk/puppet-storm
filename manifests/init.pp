# == Class: storm
#
# Full description of class storm here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { storm:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Kaya Kupferschmidt <k.kupferschmidt@dimajix.de>
#
# === Copyright
#
# Copyright 2015 Kaya Kupferschmidt, unless otherwise noted.
#
class storm (
  $version = $storm::params::storm_version,
  $homedir = $storm::params::storm_home,

  $local_dir = $storm::params::storm_local_dir,
  $cluster_mode = $storm::params::storm_cluster_mode,

  $zookeeper_servers = $storm::params::storm_zookeeper_servers,
  $zookeeper_port = $storm::params::storm_zookeeper_port,
  $zookeeper_root = $storm::params::storm_zookeeper_root,
  $zookeeper_session_timeout = $storm::params::storm_zookeeper_session_timeout,
  $zookeeper_retry_times = $storm::params::storm_zookeeper_retry_times,
  $zookeeper_retry_interval = $storm::params::storm_zookeeper_retry_interval,

  $nimbus_host = $storm::params::nimbus_host,
  $nimbus_thrift_port = $storm::params::nimbus_thrift_port,
  $nimbus_childopts = $storm::params::nimbus_childopts,

  $ui_port = $storm::params::ui_port,
  $ui_childopts = $storm::params::ui_childopts,

  $drpc_port = $storm::params::drpc_port,
  $drpc_servers = $storm::params::drpc_servers,
  $drpc_invocations_port = $storm::params::drpc_invocations_port,

  $logviewer_port = $storm::params::logviewer_port,
  $logviewer_childopts = $storm::params::logviewer_childopts,

  $supervisor_start_port = $storm::params::supervisor_start_port,
  $supervisor_workers = $storm::params::supervisor_workers,
  $supervisor_childopts = $storm::params::supervisor_childopts,
  $supervisor_enable = $storm::params::supervisor_enable,

  $worker_childopts = $storm::params::worker_childopts

) inherits storm::params
{
}

