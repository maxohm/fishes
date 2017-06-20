#!/bin/sh -x
#
PM=`which portmaster`
$PM --check-depends
yes | $PM --check-port-dbdir
yes | $PM -s
$PM -y --clean-distfiles