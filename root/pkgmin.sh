#!/bin/sh -x
#
# FreeBSD ports specialized script.
#
# (c) 2018, maxohm [ at ] gmail.com
#
ping="`which ping` -q -c 1 -W 1"
ntpq="`which ntpdate` -4 -v -b"
#
if $ping ntp1.niiftri.irkutsk.ru >/dev/null; then
 $ntpq ntp1.niiftri.irkutsk.ru >> /var/log/ntpd.log
else
 exit 1
fi
#
svnc="`which svn` up"
rm="`which rm` -rfd"
make="`which make` -j5"
pkg=`which pkg`
#
RML="cad/astk-*"
RML="$RML math/metis-*"
RML="$RML accessibility"
RML="$RML arabic"
RML="$RML biology"
RML="$RML chinese"
RML="$RML finance"
RML="$RML french"
RML="$RML games"
RML="$RML german"
RML="$RML hebrew"
RML="$RML hungarian"
RML="$RML japanese"
RML="$RML korean"
RML="$RML polish"
RML="$RML portuguese"
RML="$RML ukrainian"
RML="$RML vietnamese"
#
cd /usr/ports; $svnc; $svnc; $make index; #$rm $RML;
#
cd /usr/ports/ports-mgmt/pkg; make deinstall install clean
cd /usr/ports/ports-mgmt/portmaster; make install clean
#
pmi="`which portmaster` -BDf --force-config"
#
PKG="net/isc-dhcp44-server"
PKG="$PKG sysutils/screen"
PKG="$PKG sysutils/usb_modeswitch"
PKG="$PKG archivers/p7zip"
#
$pkg audit -Fr
#
$pmi $PKG
#
