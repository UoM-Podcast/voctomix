#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

ffmpeg -y -nostdin \
-rtsp_transport tcp -itsoffset 0.250 -use_wallclock_as_timestamps 1 -thread_queue_size 1024 -i rtsp://169.254.1.1/vaddio-av-bridge-stream \
-f lavfi -thread_queue_size 1024 -i anullsrc=r=48000 \
-c:v rawvideo \
-c:a pcm_s16le \
-pix_fmt yuv420p \
-ar $AUDIORATE \
-r $FRAMERATE -field_order 0 \
-f matroska tcp://localhost:10001
