#!/bin/sh
#
PM=`which portmaster`
$PM --check-depends
yes | $PM --check-port-dbdir
yes | $PM portmaster -s
$PM -y --clean-distfiles
