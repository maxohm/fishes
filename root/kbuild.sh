#!/bin/sh -x
#
# FreeBSD src build
#
# (c) 2019, maxohm [ at ] gmail.com
#
make="`which make` -DNO_CLEAN -DNOCLEAN"
#
cd /usr/src
#
$make buildworld
$make kernel-toolchain KERNCONF=$1
$make buildkernel KERNCONF=$1
$make reinstallkernel KERNCONF=$1
#
chmod a-x /usr/libexec/sendmail/sendmail
#