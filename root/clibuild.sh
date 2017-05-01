#!/bin/sh -x
#
~/clean.sh > /dev/null
mkdir -vp /usr/obj/usr/src/tmp/usr/lib/i18n
make -j5 buildworld > /dev/null
make buildkernel KERNCONF=$1 > /dev/null

