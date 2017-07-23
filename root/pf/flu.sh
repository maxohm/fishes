#!/bin/sh -x
#
# PF TABLES LOG SCRIPT
# (c) 2017, maxohm [ at ] gmail.com
#
pf=`which pfctl`
#
# LOG
#
$pf -Fa >/var/log/pf.$1.log
#
