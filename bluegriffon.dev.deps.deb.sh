#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -fy install"
#
$install git rustc cargo autoconf2.13 libgtk-3-dev libgconf2-dev libdbus-glib-1-dev libnspr4-dev libmemory-usage-perl
#
#mkdir -vp bluegriffon
#cd bluegriffon
#git clone https://github.com/mozilla/gecko-dev ./
#git clone git://github.com/therealglazou/bluegriffon
#
#git reset --hard `cat bluegriffon/config/gecko_dev_revision.txt`
#patch -p 1 < bluegriffon/config/gecko_dev_content.patch
#patch -p 1 < bluegriffon/config/gecko_dev_idl.patch
#cp -fv bluegriffon/config/mozconfig.ubuntu64 ./.mozconfig
#./mach build
#