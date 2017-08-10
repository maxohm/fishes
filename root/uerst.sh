#!/bin/sh -x
#
# FreeBSD usb device resetting script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
grep=`which grep`
head="`which head` -n1"
ifcfg=`which ifconfig`
tr="`which tr` ':' '\n'"
test=`which test`
ue=`$ifcfg | $grep ue | $tr | $head`
#
#
if $test -n $ue; then
 echo ok $ue
 exit 0
else
fi
#
leep=`which sleep`
uconf=`which usbconfig`
#
dev=`$uconf | $grep $1 | $tr | $head`
if $test -c /dev/$dev; then
 echo ok $dev
else
 exit 1
fi
#
$leep 1; $uconf -d $dev power_off
$leep 5; $uconf -d $dev power_on
$leep 9
