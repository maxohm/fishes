#!/bin/sh -x
#
# TAR archiving (LZMA2 compression)
#
# (c) 2019, maxohm [ at ] gmail.com
#
tar=`which tar`
xz=`which xz`
#ssl=`which openssl`
#host=`uname -n`
#
$tar --exclude '*.tar.*' --exclude '.svn' --exclude '.git' -cf - $1 | $xz -zc9e > $1.tar.xz
#
