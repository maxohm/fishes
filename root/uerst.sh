#!/bin/sh -x
#
# specialized
#
# (c) 2019, maxohm [ at ] gmail.com
#
tr=`which tr`
grep=`which grep`
head=`which head`
leep=`which sleep`
uconf=`which usbconfig`
test=`which test`
#
dev=`$uconf | $grep $1 | $tr ':' '\n' | $head -n1`
if $test -c /dev/$dev; then
 echo ok $dev
else
 exit 1
fi
#
$leep 1; $uconf -d $dev power_off
$leep 5; $uconf -d $dev power_on
$leep 9
#