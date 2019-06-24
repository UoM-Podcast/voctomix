#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

ffmpeg -y -nostdin \
-rtsp_transport tcp -i rtsp://$CAM1_USER:$CAM1_PASS@$CAM1_IP:$CAM1_PORT/axis-media/media.amp?videocodec=h264 \
-f alsa -thread_queue_size 1024 -i hw:0,0 -ac 2 \
-c:v rawvideo \
-c:a pcm_s16le \
-pix_fmt yuv420p \
-ar $AUDIORATE \
-r $FRAMERATE -field_order 0 \
-f matroska tcp://localhost:10000
# -f lavfi -thread_queue_size 1024 -i anullsrc=r=48000 \
