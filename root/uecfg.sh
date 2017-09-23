#!/bin/sh -x
#
# FreeBSD ue* device config script w/ntpdating.
#
# (c) 2017, maxohm [ at ] gmail.com
#
leep=`which sleep`
uswch="/usr/local/sbin/usb_modeswitch -c"
uconf="/usr/local/etc/usb_modeswitch.conf"
ifcfg=`which ifconfig`
rt=`which route`
#
$uswch $uconf &
$leep 15
$ifcfg $1 192.168.8.2/24
$leep 5
$rt add default 192.168.8.1
$ifcfg $1 up
$leep 5
#
ping="`which ping` -q -c 1 -W 1"
ntpq="`which ntpdate` -4 -v -b"
if $ping ntp1.niiftri.irkutsk.ru >/dev/null; then
 $ntpq ntp1.niiftri.irkutsk.ru >> /var/log/ntpd.log
fi
