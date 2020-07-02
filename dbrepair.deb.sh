#!/bin/sh -x
#
# (c) 2020, maxohm [ at ] gmail.com
# (!) requires sudo
#
rm -rf /var/cache/debconf/*;dpkg-reconfigure debconf;apt-get update;apt-get upgrade
