#!/bin/sh -x
#
TAR=`which tar`
BZ=`which bzip2`
$TAR -cf - --exclude '*.tar.*' $1 | $BZ -zc9 > $1.tar.bz2
#