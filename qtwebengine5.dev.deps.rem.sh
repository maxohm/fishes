#
# (c) 2019, maxohm [ at ] gmail.com
# (!) requires sudo
#
purge="`which apt-get` -fy purge"
#
#$install g++ make qt5-qmake qtwebengine5-dev
$purge alsa-base libdbus-1-dev ffmpeg fontconfig libatk1.0-dev libavcodec-dev libavformat-dev libavutil-dev libbz2-dev libcairo2-dev libdrm-dev libevent-dev libexif-dev libfreetype6-dev libglib2.0-dev libharfbuzz-dev libicu-dev libjsoncpp-dev liblzma-dev libmtp-dev libnspr4-dev libnss3-dev libopus-dev libpango1.0-dev libpangocairo-1.0-0 libpci-dev libpng-dev libprotobuf-dev libpulse-dev libsrtp0-dev libssl-dev libudev-dev libusb-dev libvpx-dev libwebp-dev libx11-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxext-dev libxfixes-dev libxi-dev libxml2-dev libxrandr-dev libxrender-dev libxslt1-dev libxss-dev libxt-dev libxtst-dev minizip perl speex valgrind wdiff yasm zlib1g-dev
apt-get autoclean
apt-get autoremove
