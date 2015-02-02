# storm

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with storm](#setup)
    * [What storm affects](#what-storm-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with storm](#beginning-with-storm)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)


<a name="overview"></a>
## Overview

The storm module will install Apache Storm and configure it.


<a name="module-description"></a>
## Module Description

The storm module will install Apache Storm and configure it. The installation
will be performed from a tgz archieve downloaded from apache.org.

You will also need a Zookeeper cluster for Storm to work. The installation of
Zookeeper is not done in this module, although you need to provide the IP
address (or hostnames) of the zookeeper servers.


<a name="setup"></a>
## Setup


<a name="what-storm-affects"></a>
### What storm affects

* No package will be installed
* /opt/storm will contain the storm installation
* /etc/storm will contain the storm configuration
* In addition, upstart scripts will be provided for Ubuntu


<a name="setup-requirements"></a>
### Setup Requirements

The module currently only supports Ubuntu (only tested with 14.04)


<a name="beginning-with-storm"></a>
### Beginning with storm

**Example**: one-machine with all services:

    class {'storm':
        version => '0.9.3' 
        
    }

    include storm::install
    include storm::config

    include storm::nimbus
    include storm::drpc
    include storm::ui
    include storm::supervisor


## Usage


## Reference


## Limitations

## Development


