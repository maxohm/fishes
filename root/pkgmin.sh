#!/bin/sh -x
#
ping="`which ping` -q -c 1 -W 1"
ntpq="`which ntpdate` -4 -v -b"
#
if $ping ntp1.vniiftri.ru >/dev/null; then
 $ntpq ntp1.vniiftri.ru >> /var/log/ntpd.log
fi
 cd /usr/ports; rm -rfd cad/astk-* math/metis-* accessibility arabic biology chinese finance french games german hebrew hungarian japanese korean polish portuguese ukrainian vietnamese; make index;
 cd /usr/ports/ports-mgmt/pkg && make install clean
 cd /usr/ports/ports-mgmt/portmaster && make install clean
 #
 PMI="`which portmaster` -BDgf --force-config"
 PKG="sysutils/usb_modeswitch"
 PKG="$PKG net/isc-dhcp43-server"
 $PMI $PKG
