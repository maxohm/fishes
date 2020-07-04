#
# (c) 2020, maxohm [ at ] gmail.com
# (!) requires sudo
#
umount -f /media/cdrom
echo Смена носителя: вставьте диск с меткой
echo «OS Linux DVD»
read varname
mount /media/cdrom
#
apt-cdrom -d=/media/cdrom add
apt-get update
apt-get -fy upgrade
#
umount -f /media/cdrom
echo Смена носителя: вставьте диск с меткой
echo «OS Linux devel DVD»
read varname
mount /media/cdrom
#
apt-cdrom -d=/media/cdrom add
apt-get update
apt-get -fy upgrade
