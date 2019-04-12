#!/bin/sh -x
#
# MP4 video conversion (AAC/AVC)
#
# (c) 2019, maxohm [ at ] gmail.com
#
cat=`which cat`
ffmp=`which ffmpeg`
$cat $1 | $ffmp -i - -threads 0 -vcodec libx264 -crf 18 -acodec libfdk_aac -vbr 5 -ac 2 $1.mp4
#