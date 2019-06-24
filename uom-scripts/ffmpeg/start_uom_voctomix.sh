#!/bin/bash
sleep 1
cd /opt/voctomix/uom-scripts/ffmpeg/
sleep 2
./source-rtsp1-as-cam1.sh &
sleep 1
#./source-rtsp2-as-cam2.sh &
#sleep 1
./source-v4l2-as-framegrabber.sh
