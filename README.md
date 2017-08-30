# postfix

[![Build Status](https://travis-ci.org/whotwagner/puppet-postfix.svg?branch=master)](https://travis-ci.org/whotwagner/puppet-postfix)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with postfix](#setup)
    * [What postfix affects](#what-postfix-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with postfix](#beginning-with-postfix)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This puppet-module fully manages postfix on debian-based Linux Distributions. This module was tested with Debian Stretch, Ubuntu Trusty, Puppet 4.10.6 and Puppet 5.

## Setup

### What postfix affects

* postfix package.
* postfix main.cf configuration file.
* postfix master.cf configuration file.
* postfix maps(files created with postmap)
* postfix /etc/aliases
* postfix service.
* maybe postfix-policyd-spf-perl

### Setup Requirements

* Puppet >=  4.10.6
* [Stdlib module](https://github.com/puppetlabs/puppetlabs-stdlib)
* [Concat module](https://github.com/puppetlabs/puppetlabs-concat)

### Beginning with postfix

To have Puppet install Postfix with the default parameters, declare the postfix class:

```puppet
    class { 'postfix': }
```

When you declare this class with the default options, the module:

- Installs the Postfix software package for your operating system.
- Places the main.cf and master.cf files in your postfix-configuration-directory
- Sets the hostname to localhost
- Starts the Postfix service

## Usage

### Simple postfix configuration

```puppet
   class {'postfix':
	   myhostname => 'mail.example.com'
   }
```

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This module is tested against open source Puppet4 and Puppet5 on:

- Debian Stretch
- Ubuntu Trusty

## Development

Contribution is very welcome. Feel free to fork the project, make some changes and create pull requests. 

### Extending OS support

I am working mainly with Debian and Ubuntu. I would love to see some pull requests with code for other Linux Distributions too.

