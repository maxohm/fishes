#!/bin/sh -x
#
ffmp=`which ffmpeg`
$ffmp -threads 0 -i $1 -acodec libfdk_aac -vbr 5 -ac 6 -y $1.aac
