#!/bin/sh -x
#
# FreeBSD ports specialized script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
pmi="`which portmaster` -BDfgR --force-config"
#
PKG="sysutils/logrotate"
PKG="$PKG sysutils/htop"
#PKG="$PKG net-mgmt/netmask"
#PKG="$PKG security/portsentry"
PKG="$PKG net/dropbox-uploader"
PKG="$PKG mail/ssmtp"
#PKG="$PKG ftp/vsftpd"
PKG="$PKG net-mgmt/arpwatch"
PKG="$PKG net/samba46"
#PKG="$PKG net-p2p/transmission-daemon"
PKG="$PKG net/miniupnpd"
PKG="$PKG sysutils/smartmontools"
#PKG="$PKG net/openntpd"
PKG="$PKG security/tor-devel"
PKG="$PKG misc/mc"
#
#PKG="$PKG devel/git"
#PKG="$PKG net/openntpd"
#PKG="$PKG net/openntpd"
#
$pmi $PKG
