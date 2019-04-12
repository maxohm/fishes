#!/bin/sh -x
#
# AAC 2-channel audio conversion script
#
# (c) 2019, maxohm [ at ] gmail.com
#
ff=`which ffmpeg`
$ff -threads 0 -i $1 -acodec libfdk_aac -vbr 5 -ac 2 -y $1.aac
#