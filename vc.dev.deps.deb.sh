#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install make g++ yasm pkg-config libfuse-dev libwxgtk3.0-dev
#
