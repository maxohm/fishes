#!/bin/sh
#
# IP Auto log script
# (c) 2017, maxohm [ at ] gmail.com
#
XHOME="/etc/pf"
XLOG="/var/log/XLOG"
CHOWN="/usr/sbin/chown -fR"
CHMOD="/bin/chmod -f"
#
WHOIS="/usr/bin/whois"
GREP="/usr/bin/grep"
TAIL="/usr/bin/tail -c3"
MKDIR="/bin/mkdir"
TOUCH="/usr/bin/touch"
#
#FIX PERMISSIONS
#
$CHOWN 0:0 $XHOME
$CHMOD 0640 $XHOME/*
$CHMOD 0740 $XHOME
$CHMOD 0740 $XHOME/*.sh
#
#GET COUNTRY CODE
#
XCOUNTRY=`$WHOIS $1 | $GREP ountry | $TAIL`
$MKDIR -p $XLOG/$XCOUNTRY
$WHOIS $1 > $XLOG/$XCOUNTRY/$1
#
$CHOWN 0:0 $XLOG
