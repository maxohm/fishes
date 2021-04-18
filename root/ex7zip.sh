#!/bin/sh -x
#
# 7z archiving LZMA2 compression w/aes encryption.
#
# (c) 2019, maxohm [ at ] gmail.com
#
cat=`which cat`
tar=`which tar`
xz=`which 7z`
ssl=`which openssl`
host=`which uname` -n
rm=`which rm`
#
#$xz a -mtc=on -mx=9 -myx=9 -ssw -t7z -y -- $1.7z $1 > /dev/null
$xz a -mtc=on -mx=9 -myx=9 -ssw -t7z -mhe=on -p$host -y -- $1.7x $1 > /dev/null
#$cat $1.7z | $ssl enc -aes-128-cbc -k $host -e > $1.x
#$rm -f $1.7z
#
