#!/bin/sh -x
#
ping="`which ping`  -q -c 1 -W 1"
if $ping inbox.ru >/dev/null; then
 #exit
fi
#
ifcfg=`which ifconfig`
if $ifcfg | grep $1 > /dev/null; then
else
 exit
fi
#
rt=`which route`
$ifcfg $1 192.168.8.2/24
$rt -n add -inet default 192.168.8.1
$ifcfg $1 up
#
/etc/pf/pf.snr.sh $1
#
test="`which test` -c"
if $test /dev/da1s1; then
 /sbin/mount -t msdosfs -fuw -o large -o noexec -o noatime /dev/da1s1 /archive
fi
#
ntpq="`which ntpdate` -4 -v -b"
if $ping ntp1.vniiftri.ru >/dev/null; then
 $ntpq ntp1.vniiftri.ru >> /var/log/ntpd.log
fi
#

