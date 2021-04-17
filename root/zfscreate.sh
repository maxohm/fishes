#!/bin/sh
#
gpart destroy -F ada0
gpart create -s gpt ada0
gpart add -s 256 -a 4k -t freebsd-boot -l boot0 ada0
gpart add -s 2g -a 4k -t freebsd-swap -l swap0 ada0
gpart add -a 4k -t freebsd-zfs -l disk0 ada0
gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada0
gnop create -S 4096 /dev/gpt/disk0
#
gpart destroy -F ada1
gpart create -s gpt ada1
gpart add -s 256 -a 4k -t freebsd-boot -l boot1 ada1
gpart add -s 2g -a 4k -t freebsd-swap -l swap1 ada1
gpart add -a 4k -t freebsd-zfs -l disk1 ada1
gpart bootcode -b /boot/pmbr -p /boot/gptzfsboot -i 1 ada1
gnop create -S 4096 /dev/gpt/disk1
#
sysctl kern.geom.debugflags=0x10
kldload opensolaris
kldload zfs
#
zpool create -f -o altroot=/mnt -O canmount=off zroot mirror /dev/gpt/disk0.nop /dev/gpt/disk1.nop
#zpool create -f -o altroot=/mnt -O canmount=off zroot /dev/gpt/disk0.nop
zfs set checksum=fletcher4                                   zroot
#zfs set atime=off                                            zroot
zfs create -o mountpoint=/                                      zroot/ROOT
zfs create -o compression=on 	-o exec=on      -o setuid=off   zroot/tmp
chmod 1777 /mnt/zroot/tmp
#
zfs create -o compression=off                   -o setuid=off   zroot/home
#
zfs create                                                      zroot/usr
zfs create -o compression=lzjb                  -o setuid=off   zroot/usr/ports
zfs create -o compression=off	-o exec=off     -o setuid=off   zroot/usr/ports/packages
#
zfs create -o compression=lzjb  -o exec=off     -o setuid=off   zroot/usr/src
zfs create                                                      zroot/usr/obj
#
zfs create                                                      zroot/var
zfs create -o compression=lzjb  -o exec=off     -o setuid=off   zroot/var/crash
zfs create                      -o exec=off     -o setuid=off   zroot/var/db
zfs create -o compression=lzjb  -o exec=on      -o setuid=off   zroot/var/db/pkg
zfs create                      -o exec=off     -o setuid=off   zroot/var/empty
zfs create -o compression=lzjb  -o exec=off     -o setuid=off   zroot/var/log
zfs create -o compression=gzip  -o exec=off     -o setuid=off   zroot/var/mail
zfs create                      -o exec=off     -o setuid=off   zroot/var/run
zfs create -o compression=lzjb  -o exec=on      -o setuid=off   zroot/var/tmp
chmod 1777 /mnt/zroot/var/tmp
