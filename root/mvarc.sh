#!/bin/sh -x
#
test=`which test`
#
if $test "$1" = ""; then
 exit 1
fi
#
if $test -c $1; then
 echo ok $1
else
 exit 1
fi
#
if $test "$2" = ""; then
 exit 2
fi
#
if $test -d $2; then
 echo ok $2
else
 exit 2
fi
#
mnt=`which mount`
#
$mnt -t msdosfs -fw -o large -o noexec -o noatime $1 $2
#
md="`which mkdir` -vp"
mov="`which mv` -fv"
arcwd="$2`uname -n`"
#
$md $arcwd
#
if $test -d $arcwd; then
 $mov /*.tar.* $arcwd
 $mov /usr/*.tar.* $arcwd
 $mov /usr/local/etc.tar.g $arcwd/uetc.tar.g
else
 exit 3
fi
#
