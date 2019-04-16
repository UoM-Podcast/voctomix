#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

/home/andrew/ffmpeg-ndi/ffmpeg -y -nostdin \
-f libndi_newtek -thread_queue_size 1024 -re -field_order 0 \
-i "BIRDDOG-AE557 (HDMI)" \
-f lavfi -thread_queue_size 1024 -i anullsrc=r=48000 \
-c:v rawvideo \
-c:a pcm_s16le \
-r 60 -field_order 0 \
-f matroska tcp://localhost:10000



#-pix_fmt yuv420p

