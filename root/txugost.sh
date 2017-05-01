#!/bin/sh -x
#
TAR=`which tar`
XZ=`which xz`
SSL=`which openssl`
#
time -h $SSL enc -gost89 -d < $1 | $XZ -cd | (cd $2; $TAR xvf -)
#

