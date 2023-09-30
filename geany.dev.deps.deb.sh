#!/bin/sh -x
#
# (c) 2022, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install g++ libgtk2.0-dev libglib2.0-dev intltool
#./configure --disable-html-docs
#