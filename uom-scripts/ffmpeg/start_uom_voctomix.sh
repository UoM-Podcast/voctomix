#!/bin/bash
export DISPLAY=:0 &
sleep 1
cd $HOME/voctomix-uom/voctomix/uom-scripts/ffmpeg/
#../../voctocore/voctocore.py -v &
#PID=$!
#echo "PID=$PID"
sleep 2
./source-rtsp1-as-cam1.sh >/dev/null 2>/dev/null &
sleep 1
./source-rtsp2-as-cam2.sh >/dev/null 2>/dev/null &
sleep 1
./source-v4l2-as-framegrabber.sh >/dev/null 2>/dev/null &
#kill $PID
#wait
