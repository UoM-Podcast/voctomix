#!/bin/sh
confdir="`dirname "$0"`/../"
. $confdir/default-config.sh
if [ -f $confdir/config.sh ]; then
	. $confdir/config.sh
fi

ffmpeg -y -nostdin \
	-i tcp://localhost:15000 \
	-threads:0 0 \
	-aspect 16:9 \
	-c:v libx264 \
	-maxrate:v 3000k -bufsize:v 8192k -crf 21 \
	-pix_fmt yuv420p -profile:v main -g:v 25 \
	-preset:v veryfast \
	\
	-ac 1 -c:a aac -b:a 96k -ar 44100 \
	\
	-y -f flv $STREAM_KEY
