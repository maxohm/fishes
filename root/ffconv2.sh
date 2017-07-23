#!/bin/sh
cat=`which cat`
ffmp=`which ffmpeg`
$cat $1 | $ffmp -i - -threads 0 -vcodec libx264 -crf 18 -acodec libfdk_aac -vbr 5 -ac 2 $1.mp4
