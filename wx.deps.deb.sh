#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -fy install"
#
$install libcppunit-dev libfuse-dev pkg-config yasm gtk2.0-dev intltool
#