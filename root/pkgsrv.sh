#!/bin/sh -x
#
PMI="`which portmaster` -BDgf"
#
PKG="sysutils/logrotate" 
PKG="$PKG sysutils/htop" 
#P="$P net-mgmt/netmask" 
#P="$P security/portsentry" 
PKG="$PKG net/dropbox-uploader" 
PKG="$PKG mail/ssmtp" 
#P="$P ftp/vsftpd" 
PKG="$PKG net-mgmt/arpwatch"
PKG="$PKG net/samba46" 
PKG="$PKG net-p2p/transmission-daemon" 
PKG="$PKG net/miniupnpd" 
#P="$P sysutils/smartmontools"
#P="$P net/openntpd"
PKG="$PKG security/tor-devel"
PKG="$PKG misc/mc"
#
$PMI $PKG