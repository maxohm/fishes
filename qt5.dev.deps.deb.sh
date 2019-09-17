#!/bin/sh -x
#
# (c) 2019, maxohm [ at ] gmail.com
#
install="sudo `which apt-get` -fy install"
#
#sudo apt list --installed | tr '/' '\n' |  grep qt
#
$install git
#
#git clone git://code.qt.io/qt/qt5.git
#./init-repository -f --module-subset=all
#git checkout v5.11.0
#git submodule foreach --recursive "git clean -dfx" && git clean -dfx
#
$install g++-6
#
#sudo update-alternatives --remove-all gcc 
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 20
#sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 10
#sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
#sudo update-alternatives --set cc /usr/bin/gcc
#sudo update-alternatives --config gcc
#
#sudo update-alternatives --remove-all g++
#sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 20
#sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 10
#sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
#sudo update-alternatives --set c++ /usr/bin/g++
#sudo update-alternatives --config g++
$install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
$install libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libdbus-1-dev libfontconfig1-dev libcap-dev libxtst-dev libpulse-dev libudev-dev libpci-dev libnss3-dev libasound2-dev libxss-dev libegl1-mesa-dev gperf bison
#
#mkdir -vp ./qt5.11_gcc6; cd ./qt5.11_gcc6
#../qt5/configure --recheck-all -opensource -confirm-license -release -shared -make libs -make examples -optimized-qmake -no-qml-debug -no-directfb -no-kms -system-xcb -qt-zlib -qt-libjpeg -qt-libpng -qt-harfbuzz -qt-xkbcommon -qt-freetype -qt-pcre -no-icu -skip activeqt -skip androidextras -skip charts -skip datavis3d -skip enginio -skip gamepad -skip graphicaleffects -skip macextras -skip purchasing -skip quickcontrols2 -skip remoteobjects -skip speech -skip virtualkeyboard -skip wayland -webengine-pepper-plugins -webengine-proprietary-codecs
#make -ks
#
$install qtchooser
#
#echo /usr/local/Qt-5.11.0/bin > ./qt5.conf
#echo /usr/lib/x86_64-linux-gnu >> ./qt5.conf
#sudo cp -fv ./qt5.conf /usr/share/qtchooser/qt5-x86_64-linux-gnu.conf
#export QT_SELECT=qt5
#qtchooser -print-env
#
#libclang-6.0-dev llvm-6.0 libtool clang clang-6.0
#build-essential perl python git
#g++-6 perl python git
#libx11-xcb-dev libxcb-composite0-dev libxcb-cursor-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-dri2-0-dev libxcb-dri3-dev libxcb-glx0-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-keysyms1-dev libxcb-present-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-shape0-dev libxcb-shm0-dev libxcb-sync-dev libxcb-util-dev libxcb-xfixes0-dev libxcb-xinerama0-dev libxcb-xkb-dev libxcb-xtest0-dev libxcb1-dev
#flex bison gperf libicu-dev libxslt-dev ruby
#libasound2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
#