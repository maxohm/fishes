#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
#
tst=`which test`
objdir=`dirname $0`
objname=`basename -s .sh $0`
#
if $tst -d ../lib; then
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../lib
fi
#
if $tst -d ../../../lib; then
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:../../../lib
fi
#
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$objdir $objdir/$objname
