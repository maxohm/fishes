#!/bin/sh -x
#
# XZ archiving max compression.
#
# (c) 2017, maxohm [ at ] gmail.com
#
#
tar=`which tar`
xz=`which xz`
ssl=`which openssl`
host=`/usr/bin/uname -n`
#
$tar -cf - --exclude '*.txz' --exclude '*.tar.*' $1 | $xz -zc9 > $1.tar.xz
#
