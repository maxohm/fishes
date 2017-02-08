#!/bin/sh
FFMPG=`which ffmpeg`
echo $FFMPG -threads 0 -i $1 -acodec libfdk_aac -vbr 5 -ac 6 -y $1.aac
$FFMPG -threads 0 -i $1 -acodec libfdk_aac -vbr 5 -ac 2 -y $1.aac
