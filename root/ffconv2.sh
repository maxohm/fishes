#!/bin/sh
CAT=`which cat`
FFPROC=`which ffmpeg`
$CAT $1 | $FFPROC -i - -threads 0 -vcodec libx264 -crf 18 -acodec libfdk_aac -vbr 5 -ac 2 $1.mp4

