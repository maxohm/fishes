#!/bin/sh -x
#
test=`which test`
#
if $test -d $1; then
 echo ok $1
else
 exit 1
fi
#
arcwd="$1`uname -n`/"
md="`which mkdir` -vp"
mov="`which mv` -fv"
#
$md $arcwd
if $test -d $arcwd; then
 echo ok $arcwd
 $mov /*.tar.* $arcwd
 $mov /usr/*.tar.* $arcwd/../
 $mov /usr/local/etc.tar.g $arcwd/uetc.tar.g
else
 exit 2
fi
#
drop="`which dropbox_uploader.sh` -f ~/.dropbox_uploader upload"
$drop $1 /