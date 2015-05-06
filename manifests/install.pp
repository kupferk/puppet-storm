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
    require java

    package { 'wget': ensure => [latest,installed] }
    package { 'rsync': ensure => [latest,installed] }

    # Create home directory
    file { $homedir:
        ensure => directory
    }

    # Create logging directory
    file { $storm_logdir:
        ensure => directory
    }

    $tgzfile = "/var/tmp/apache-storm-${version}.tar.gz"
    $untardir = "/var/tmp/apache-storm-${version}"

    #Download and extract the storm archive
    exec { 'storm-get':
        command => "wget ${mirror}/apache-storm-${version}/apache-storm-${version}.tar.gz -O ${tgzfile}",
        creates => $tgzfile,
        path => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
        cwd => '/var/tmp',
        notify => Exec['storm-extract'],
        require => Package['wget']
    }

    #Install storm
    exec { 'storm-extract':
        command => "tar -C /var/tmp -xzf $tgzfile",
        creates => $untardir,
        path => ['/usr/bin', '/usr/sbin', '/sbin', '/bin'],
        notify => Exec['storm-install'],
    }

    exec { 'storm-install':
        command => "rsync -auzp --exclude=\"src\" ${untardir}/ ${homedir}",
        creates => "${homedir}/lib/storm-core-${version}.jar",
        path => ['/usr/bin', '/usr/sbin', '/sbin', 'bin'],
        # notify => Service['storm'],
        require => [File[$homedir], Package['rsync']],
    }
}

