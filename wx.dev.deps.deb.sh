#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install make gcc g++ gtk2.0-dev yasm libfuse-dev libcppunit-dev pkg-config intltool libgail-common
#