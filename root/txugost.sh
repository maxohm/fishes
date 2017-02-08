#!/bin/sh -x
#
TAR=`which tar`
XZ=`which xz`
SSL=`which openssl`
#
$SSL enc -gost89 -d < $1 | $XZ -cd | (cd $2; $TAR xvf -)
#
