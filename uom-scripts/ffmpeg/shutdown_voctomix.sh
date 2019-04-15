#!/bin/bash
ffplay -fs /home/galicaster/eeesocball.mp4 &
sleep 1
curl http://10.99.201.94:3000/nextevent &
sleep 10
echo standby 0 | cec-client -s -d 1 &
sleep 2
sudo pkill ffplay &
sudo pkill ffmpeg &
sudo pkill start_uom_voctomix.sh &
