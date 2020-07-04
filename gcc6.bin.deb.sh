#!/bin/sh -x
#
# (c) 2020, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -f install"
alt="update-alternatives"
#
$install g++-6
#
$alt --remove-all gcc 
$alt --install /usr/bin/gcc gcc /usr/bin/gcc-7 20
$alt --install /usr/bin/gcc gcc /usr/bin/gcc-6 10
$alt --install /usr/bin/cc cc /usr/bin/gcc 30
$alt --set cc /usr/bin/gcc
$alt --config gcc
#
$alt --remove-all g++
$alt --install /usr/bin/g++ g++ /usr/bin/g++-7 20
$alt --install /usr/bin/g++ g++ /usr/bin/g++-6 10
$alt --install /usr/bin/c++ c++ /usr/bin/g++ 30
$alt --set c++ /usr/bin/g++
$alt --config g++
