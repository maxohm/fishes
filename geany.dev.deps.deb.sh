#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -fy install"
#
$install g++ libgtk2.0-dev libglib2.0-dev intltool
#./configure --disable-html-docs
#