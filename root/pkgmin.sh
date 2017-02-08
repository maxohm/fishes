#!/bin/sh -x
#
cd /usr/ports; rm -rfd cad/astk-* math/metis-* accessibility arabic biology chinese finance french games german hebrew hungarian japanese korean polish portuguese ukrainian vietnamese; make index;
cd /usr/ports/ports-mgmt/pkg && make install clean
cd /usr/ports/ports-mgmt/portmaster && make install clean
#
PM="`which portmaster` -BDgf --force-config"
PM="$PM sysutils/usb_modeswitch"
PM="$PM net/isc-dhcp43-server"
#
time="`which time` -h"
#$time $PM
