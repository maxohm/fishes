#!/bin/sh -x
#
# *NIX / *NUX root + swap zeroing script
#
# (c) 2019, maxohm [ at ] gmail.com
#
test=`which test`
sw=`swapon | tail -n1 | tr ' ' '\n' | head -n1`
#rsize="`df -ah / | tr 'G' '\n' | tail -n2 | head -n1 | tr -d ' ' | tr ',' '.'`G"
#
sync=`which sync`
dzero="`which dd` if=/dev/zero bs=16M conv=notrunc"
pwroff="`which shutdown` -hP now"
dnull="`which dd` if=/dev/null"
#
if $test -e $sw; then
 swapoff $sw
 $dzero of=$sw
 mkswap -f $sw
 swapon $sw
else
 exit 1
fi
#
$dzero of=/zerofile
$dnull of=/zerofile;exit
#$sync;$sync;$pwroff
#
