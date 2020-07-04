#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install make python-dev libgl1-mesa-dev
$install qtbase5-dev qtmultimedia5-dev qttools5-dev libqt5serialport5-dev libqt5svg5-dev qtscript5-dev libqt5xmlpatterns5-dev libqt5webengine-data libqt5webengine5 libqt5webenginecore5 libqt5webenginewidgets5 qtwebengine5-dev qtwebengine5-dev-tools qtwebengine5-private-dev
$install qtcreator valgrind
#