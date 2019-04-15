#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

/home/galicaster/ffmpeg-ndi/ffmpeg -y -nostdin \
    -i tcp://localhost:11000 \
    -threads:0 0 \
    -r $FRAMERATE \
    -f libndi_newtek -pix_fmt uyvy422 VOCTOMIX
