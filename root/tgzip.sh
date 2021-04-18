#!/bin/sh -x
#
# TAR simple archiving
#
# (c) 2019, maxohm [ at ] gmail.com
#
tar=`which tar`
gz=`which gzip`
$tar -cf - --exclude '*.tar.*' $1 | $gz -c9 > $1.tar.gz
#