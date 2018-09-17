#!/bin/sh -x
#
# FreeBSD specialized script.
#
# (c) 2018, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which 7z`
ssl=`which openssl`
#
$ssl enc -aes-256-cbc -d < $1 | $xz -cd | (cd $2; $tar xvf -)
#
