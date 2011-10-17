#!/bin/bash
ffserver -f ffserver.conf &
ffmpeg -v 2 -r 5 -s 640x480 -f video4linux2 -i /dev/video0 http://localhost:8090/webcam0.ffm
ffmpeg -v 2 -r 5 -s 640x480 -f video4linux2 -i /dev/video1 http://localhost:8090/webcam1.ffm
