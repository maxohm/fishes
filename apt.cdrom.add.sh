#!/bin/sh -x
#
# (c) 2020, maxohm [ at ] gmail.com
# (!) requires sudo
#
install="sudo `which apt-get` -fy install"
#
umount -f $1
eject -vr
echo Смена носителя: вставьте диск с меткой
echo «Linux amd64 DVD»
read varname
mount $1
#
apt-cdrom -d=$1 add
apt-get update
apt-get -fy upgrade
#
#
umount -f $1
eject -vr
echo Смена носителя: вставьте диск с меткой
echo «OS Linux devel DVD»
read varname
mount $1
#
apt-cdrom -d=$1 add
apt-get update
apt-get -fy upgrade
#
