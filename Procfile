webcamserver:       mjpg_streamer -i "input_uvc.so" -o "output_http.so -w /usr/www/ -p 8080"
sinatra:            rvm exec bundle exec ruby www/control.rb

# These "procs" will take alternating webcam shots and stream them separately
#camfile0server:     mjpg_streamer -i "input_file.so -f img/cam0 -r" -o "output_http.so -w www -p 8080"
#camfile1server:     mjpg_streamer -i "input_file.so -f img/cam1 -r" -o "output_http.so -w www -p 8081"
#camfilecapture:     script/camcapture.sh
