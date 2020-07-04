#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -f install"
#
$install linux-headers-$(uname -r) firebird-dev freetds-dev libasound2-dev libcups2-dev libfontconfig1-dev libfreetype6-dev libgd-dev libglib2.0-dev libicu-dev libinput-dev libmysqlclient-dev libopenvg1-mesa-dev-lts-utopic libopenvg1-mesa-lts-utopic libpcre3-dev libpq-dev libproxy-dev libpulse-dev libsqlite0-dev libudev-dev libx11-dev libx11-xcb-dev libxcb-glx0-dev libxcb1-dev libxext-dev libxfixes-dev libxi-dev libxrandr-dev libxrender-dev unixodbc-dev
#