#!/bin/sh -x
#
TAR=`which tar`
XZ=`which xz`
SSL=`which openssl`
#
$SSL enc -bf-cbc -d < $1 | $XZ -cd | (cd $2; $TAR xvf -)