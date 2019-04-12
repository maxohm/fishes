#!/bin/sh -x
#
# AAC 5.1-channel audio conversion
#
# (c) 2019, maxohm [ at ] gmail.com
#
ff=`which ffmpeg`
$ff -threads 0 -i $1 -acodec libfdk_aac -vbr 5 -ac 6 -y $1.aac
#
