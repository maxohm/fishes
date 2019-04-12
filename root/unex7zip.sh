#!/bin/sh -x
#
# specialized
#
# (c) 2019, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which 7z`
ssl=`which openssl`
#
$ssl enc -aes-256-cbc -d < $1 | $xz -cd | (cd $2; $tar xvf -)
#
