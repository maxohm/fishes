#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install libsqlite3-dev libreadline-dev libncurses5-dev
#