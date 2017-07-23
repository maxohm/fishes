#!/bin/sh -x
#
# FreeBSD src rebuild script.
#
# (c) 2017, maxohm [ at ] gmail.com
#
make="`which make` -DNOCLEAN -DNO_CLEAN"
#
$make -j5 buildworld > /dev/null
$make buildkernel KERNCONF=$1
$make reinstallkernel KERNCONF=$1
#
chmod a-x /usr/libexec/sendmail/sendmail