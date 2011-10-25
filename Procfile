cam0server:     mjpg_streamer -i "input_file.so -f img/cam0 -r" -o "output_http.so -w www -p 8080"
cam1server:     mjpg_streamer -i "input_file.so -f img/cam1 -r" -o "output_http.so -w www -p 8081"
camcapture:     script/camcapture.sh
sinatra:        rvm exec bundle exec ruby www/control.rb
