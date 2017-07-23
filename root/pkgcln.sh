#!/bin/sh -x
#
# FreeBSD ports cleaning script. Run 3 times for maximal effect.
#
# (c) 2017, maxohm [ at ] gmail.com
#
PM=`which portmaster`
$PM --check-depends
yes | $PM --check-port-dbdir
yes | $PM -s
$PM -y --clean-distfiles