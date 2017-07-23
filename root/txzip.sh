#!/bin/sh -x
#
# FreeBSD archiving with LZMA2 compression and BLOWFISH encryption.
#
# (c) 2017, maxohm [ at ] gmail.com
#
#
tar=`which tar`
xz=`which xz`
ssl=`which openssl`
host=`/usr/bin/uname -n`
#
$tar -cf - --exclude '*.txz' --exclude '*.tar.*' $1 | $xz -zc9 | $ssl enc -bf-cbc -k $host -e > $1.tar.bf
#
