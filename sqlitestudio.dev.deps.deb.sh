#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -fy install"
#
$install libsqlite3-dev libreadline-dev libncurses5-dev
#