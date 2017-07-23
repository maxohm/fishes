#!/bin/sh -x
#
# FreeBSD msdosfs mount script. (depends on in-kernel GEOM_LABEL)
#
# (c) 2017, maxohm [ at ] gmail.com
#
test=`which test`
#
if $test "$1" = ""; then
 exit 1
fi
#
dev="/dev/msdosfs/$1"
if $test -c $dev; then
 echo ok $dev
else
 exit 2
fi
#
if $test "$2" = ""; then
 exit 3
fi
#
if $test -d $2; then
 echo ok $2
else
 exit 4
fi
#
mnt="`which mount` -t msdosfs -o large -o noexec -o noatime -fw"
$mnt $dev $2
$mnt -u $dev $2
