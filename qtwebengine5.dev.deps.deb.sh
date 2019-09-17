#!/bin/sh -x
#
sudo umount -f /media/cdrom
echo Смена носителя: вставьте диск с меткой
echo «OS Linux DVD»
read varname
sudo mount /media/cdrom
#
sudo apt-cdrom -d=/media/cdrom add
sudo apt-get update
sudo apt-get -fy upgrade
#
sudo umount -f /media/cdrom
echo Смена носителя: вставьте диск с меткой
echo «OS Linux devel DVD»
read varname
sudo mount /media/cdrom
#
sudo apt-cdrom -d=/media/cdrom add
sudo apt-get update
sudo apt-get -fy upgrade
#
install="sudo `which apt-get` -fy install"
#
$install g++ make qt5-qmake qtwebengine5-dev
#