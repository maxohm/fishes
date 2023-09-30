#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="`which apt-get` -fy install"
#
$install kbuild acpica-tools xsltproc libidl-dev libelf-dev libcurl4-openssl-dev libvpx-dev libopus-dev libxinerama-dev libxmu-dev libxml2-dev python-dev libdevmapper-dev makeself g++-multilib libpam0g-dev texlive-latex-base yasm nasm
#!!! openjdk-*-jdk !!!
#update-alternatives --config gcc
#update-alternatives --config g++
#./configure --disable-hardening --disable-python --disable-java --disable-docs --disable-sdl --with-qt-dir=/usr/local/Qt-5.11.0
#source ./env.sh
#kmk all
#cd ./out/linux.amd64/release/bin/src
