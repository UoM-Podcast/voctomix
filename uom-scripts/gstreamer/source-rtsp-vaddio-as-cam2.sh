#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

gst-launch-1.0 \
        rtspsrc location=rtsp://169.254.1.1/vaddio-av-bridge-stream ! "application/x-rtp, media=(string)video" ! decodebin ! videoconvert ! videorate ! video/x-raw,framerate=$FRAMERATE/1 ! \
		mux. \
	\
	audiotestsrc wave=silence !\
		audio/x-raw,format=S16LE,channels=2,layout=interleaved,rate=$AUDIORATE !\
		mux. \
	\
	matroskamux name=mux !\
		tcpclientsink host=localhost port=10001
