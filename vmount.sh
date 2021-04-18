#!/bin/sh
#
#
tst=`which test`
objdir=`dirname $0`
#objname=`basename -s .sh $0`
#
vbin=$objdir
#
if $tst -x $vbin; then $vbin --text --version; else echo no vbin; exit 1; fi
if $tst -z $1; then echo no device; exit 2; fi
if $tst -b $1; then $vbin --text --volume-properties; else echo no device; exit 2; fi
if $tst -z $2; then echo no mountpoint; exit 3; fi
if $tst -d $2; then
    $vbin --text --verbose $1 $2
else echo no mount point
    exit 3
fi
