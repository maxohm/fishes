#!/bin/sh -x
#
# (c) 2022, maxohm [ at ] gmail.com
# (!) requires sudo
#
sw=`swapon | grep dev | tr ' ' '\n' | head -n1`
#rsize="`df -ah / | tr 'G' '\n' | tail -n2 | head -n1 | tr -d ' ' | tr ',' '.'`G"
#
test=`which test`
dzero="`which dd` if=/dev/zero bs=16M conv=notrunc"
#
if $test -b $sw; then
 swapoff $sw
 $dzero of=$sw
 mkswap -f $sw
 swapon $sw
else
 exit 1
fi
#
dnull="`which dd` if=/dev/null"
sync=`which sync`
pwroff="`which shutdown` -hP now"
#
$dzero of=/zerofile
$dnull of=/zerofile;$sync;$sync;$pwroff
#
