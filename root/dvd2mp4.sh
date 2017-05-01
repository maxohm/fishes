#!/bin/sh
#

CAT=`which tccat`
if [ -x $CAT ]; then
    $CAT -v
else
    echo "No tccat"
    exit
fi

FF=`which ffmpeg`
if [ -x $FF ]; then
else
    echo "No ffmpeg"
    exit
fi

if [ -r $1 ]; then
    echo "Input $1"
else
    echo "No input specified"
fi

if [ $2 -eq '' ]; then
    echo "Input section $2"
else
    echo "No input section specified"
fi

if [ $3 -eq '' ]; then
    echo "Input channels $3"
else
    echo "No input channels specified"
fi



OUT="./${1##*/}.mp4"

echo $CMD



