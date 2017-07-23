#!/bin/sh -x
#
# FreeBSD simple archiving script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
tar=`which tar`
bz=`which bzip2`
$tar -cf - --exclude '*.tar.*' $1 | $bz -zc9 > $1.tar.bz2
