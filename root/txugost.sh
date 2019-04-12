#!/bin/sh -x
#
# specialized
#
# (c) 2019, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which xz`
ssl=`which openssl`
#
$ssl enc -gost89 -d < $1 | $xz -cd | (cd $2; $tar xvf -)
#