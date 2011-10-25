#!/bin/bash
#
#   camcapture - capture images from the webcam(s)
#

# Create files from alternating snapshots from the webcams
x=0
while :
do
  streamer -c /dev/video0 -o img/cam0/snap$x.jpeg
  #streamer -c /dev/video1 -o img/cam1/snap$x.jpeg
  x=`expr $x + 1`
done
