#!/bin/sh -x
#
PM="`which portmaster` -BDgf --force-config"
#
PM="$PM sysutils/logrotate" 
PM="$PM sysutils/htop" 
#PM="$PM net-mgmt/netmask" 
#PM="$PM security/portsentry" 
PM="$PM net/dropbox-uploader" 
PM="$PM mail/ssmtp" 
#PM="$PM ftp/vsftpd" 
PM="$PM net-mgmt/arpwatch"
#PM="$PM net/samba44" 
#PM="$PM net-p2p/transmission-daemon" 
#PM="$PM net/miniupnpd" 
#PM="$PM sysutils/smartmontools"
#PM="$PM net/openntpd"
#PM="$PM security/tor-devel"
PM="$PM misc/mc"
#
time="`which time` -h"
$time $PM
#
