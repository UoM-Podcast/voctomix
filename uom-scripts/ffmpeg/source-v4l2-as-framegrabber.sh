#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

ffmpeg -y -nostdin \
    -framerate $FRAMERATE -video_size hd$HEIGHT -thread_queue_size 1024 -i /dev/video0 \
	-f lavfi -thread_queue_size 1024 -i anullsrc=r=48000 \
        -pix_fmt yuv420p \
	-c:v rawvideo \
	-c:a pcm_s16le \
	-f matroska -field_order progressive \
	tcp://localhost:10002
