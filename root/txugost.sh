#!/bin/sh -x
#
# FreeBSD specialized script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which xz`
ssl=`which openssl`
#
$ssl enc -gost89 -d < $1 | $xz -cd | (cd $2; $tar xvf -)