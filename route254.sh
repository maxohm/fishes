#!/bin/sh -x
#
# (c) 2021, maxohm [ at ] gmail.com
# (!) requires sudo
#
cat /etc/resolv.conf > $0.conf
echo nameserver 192.168.1.254 >> $0.conf
route add default gw 192.168.1.254
cp -fv $0.conf /etc/resolv.conf 
