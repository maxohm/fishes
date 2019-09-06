#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
sudo rm -rf /var/cache/debconf/*;sudo dpkg-reconfigure debconf;sudo apt-get update;sudo apt-get upgrade
