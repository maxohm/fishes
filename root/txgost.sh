#!/bin/sh -x
#
# TAR archiving (LZMA2 compression, GOST encryption)
#
# (c) 2019, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which xz`
ssl=`which openssl`
host=`/usr/bin/uname -n`
#
$tar -cf - --exclude '*.txz' --exclude '*.tar.*' $1 | $xz -zc9e | $ssl enc -gost89 -k $host -e > $1.tar.g
#
