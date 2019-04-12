#!/bin/sh -x
#
# FreeBSD src rebuild
#
# (c) 2019, maxohm [ at ] gmail.com
#
cd /usr/src
~/clean.sh > /dev/null
#
mkdir -vp /usr/obj/usr/src/tmp/usr/lib/i18n
#
make -j5 buildworld > /dev/null
make buildkernel KERNCONF=$1 > /dev/null
make installkernel KERNCONF=$1
#
chmod a-x /usr/libexec/sendmail/sendmail
cp -fv ~/*.fnt /usr/share/vt/fonts/
#