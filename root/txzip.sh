#!/bin/sh -x
#
TAR=`which tar`
XZ=`which xz`
SSL=`which openssl`
PASS=`/usr/bin/uname -n`
#
$TAR -cf - --exclude '*.txz' --exclude '*.tar.*' $1 | $XZ -zc9e | $SSL enc -aes-256-gcm -k $PASS -e > $1.tar.x
#
