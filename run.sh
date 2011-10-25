#!/bin/bash
#
# This script will start the necessary processes to get images from the
# webcam(s) and stream them to a web interface that also contains controls to
# command the tank.
#
# Currently it will check for new files in the cam{0,1} directories
# and will serve them up via http, then remove that file.
# This will act as a stream of images coming from the webcams to a webpage.
#
# This method is to workaround the fact that I cannot stream more than one webcam
# at a time, so it will take a snapshot from one, serve it up, then take a snapshot
# of the other, serve it up and repeat infinitely.
#

# Make foreman start all the necessary processes
rvm exec bundle exec foreman start
