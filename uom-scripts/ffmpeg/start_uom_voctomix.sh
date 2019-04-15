#!/bin/bash
export DISPLAY=:0 &
echo on 0 | cec-client -s -d 1 &
sleep 1
cd /home/galicaster/voctomix/uom-scripts/ffmpeg/
#../../voctocore/voctocore.py -v &
PID=$!
echo "PID=$PID"
sleep 2
./source-hdmi1-as-cam1 >/dev/null 2>/dev/null &
sleep 1
./source-ndi1-as-cam2 >/dev/null 2>/dev/null &
sleep 1
./stream-ndi.sh >/dev/null 2>/dev/null &
./play-mixed-ffplay.sh
kill $PID
wait
