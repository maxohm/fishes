#!/bin/sh -x
#
make="`which make` -DNOCLEAN -DNO_CLEAN"
#
$make -j5 buildworld > /dev/null
$make buildkernel KERNCONF=$1 #> /dev/null
$make reinstallkernel KERNCONF=$1
#
chmod a-x /usr/libexec/sendmail/sendmail