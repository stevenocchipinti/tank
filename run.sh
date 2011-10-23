#!/bin/bash
#
# This script will check for new files in the cam{0,1} directories
# and will serve them up via http, then remove that file.
#
# This will act as a stream of images coming from the webcams to a webpage.
#
# This method is to workaround the fact that I cannot stream more than one webcam
# at a time, so it will take a snapshot from one, serve it up, then take a snapshot
# of the other, serve it up and repeat infinitely.
#

# TODO: These processes should be managed by the Foreman gem!

# This example will stream the webcam over HTTP
#mjpg_streamer -i "input_uvc.so" -o "output_http.so -w /usr/www/ -p 8080" &

# Stream the files from each webcam on a separate port
mjpg_streamer -i "input_file.so -f img/cam0 -r" -o "output_http.so -w www -p 8080" &
mjpg_streamer -i "input_file.so -f img/cam1 -r" -o "output_http.so -w www -p 8081" &

# Start Sinatra!
rvm exec bundle exec ruby www/control.rb &

# Create the files from alternating snapshots from the webcams
x=0
while :
do
  streamer -c /dev/video0 -o img/cam0/snap$x.jpeg
  streamer -c /dev/video1 -o img/cam1/snap$x.jpeg
  x=`expr $x + 1`
done
