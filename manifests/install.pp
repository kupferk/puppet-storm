# == Class: storm::install
#
# Install class for storm. Takes care of package installation, etc.
#
# === Parameters
#
# [*mirror*]
# The location to download the installer from.
# [*version*]
# The version of storm to install.
# [*homedir*]
# Install location for the final storm package.
#
# === Examples
#
# class { 'storm::install':
# mirror => 'http://www.mymirror.com/storm-package',
# }
#
# === Authors
#
# Kaya Kupferschmidt <k.kupferschmidt@dimajix.de>
#
# === Copyright
#
# Copyright 2015 Kaya Kupferschmidt, unless otherwise noted.
#
class storm::install (
    $mirror = $storm::params::storm_mirror,
) inherits storm {
    include storm::params
    
    package { 'wget': ensure => [latest,installed] }
        

    #Download and extract the storm archive
    exec { 'storm-get':
        command => "wget ${mirror}/apache-storm-${version}/apache-storm-${version}.tar.gz \
        -O /var/tmp/storm-${version}.tar.gz",
        creates => "/var/tmp/storm-${version}.tar.gz",
        path => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
        cwd => '/var/tmp',
        notify => Exec['storm-extract'],
    }

    #Install storm
    exec { 'storm-extract':
        command => "tar -C /var/tmp -xzf /var/tmp/apache-storm-${version}.tar.gz",
        creates => "/var/tmp/storm-${version}",
        path => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
        notify => Exec['storm-install'],
    }

    exec { 'storm-install':
        command => "rsync -auzp --exclude=\"src\" /var/tmp/apache-storm-${version}/ ${homedir}",
        creates => "${homedir}/storm-${version}.jar",
        path => ['/usr/bin', '/usr/sbin', '/sbin', 'bin'],
        # notify => Service['storm'],
        require => File[$homedir],
    }
}

