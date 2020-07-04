#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
# (!) requires sudo
#
today="`date -Idate`"
grep $today".*.install " /var/log/dpkg.log | awk '{ print $4 }' | cut -d: -f1 | xargs apt-get -fy purge
