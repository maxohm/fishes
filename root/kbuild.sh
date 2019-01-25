#!/bin/sh -x
#
# FreeBSD src rebuild script.
#
# (c) 2017, maxohm [ at ] gmail.com
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
