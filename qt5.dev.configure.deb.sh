#!/bin/sh -x
#
# (c) 2020, maxohm [ at ] gmail.com
#
../qtbase-everywhere-src-5.11.0/configure --recheck-all -opensource -confirm-license -release -shared -make libs -make examples -optimized-qmake -no-directfb -no-kms -system-xcb -qt-zlib -qt-libjpeg -qt-libpng -qt-harfbuzz -qt-xkbcommon -qt-freetype -qt-pcre -no-icu
# -skip activeqt -skip androidextras -skip charts -skip datavis3d -skip enginio -skip gamepad -skip graphicaleffects -skip macextras -skip purchasing -skip quickcontrols2 -skip remoteobjects -skip virtualkeyboard -skip wayland  -webengine-pepper-plugins -webengine-proprietary-codecs
