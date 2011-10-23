require 'sinatra'
require 'haml'
require 'sass'
require_relative 'Tank'

# ==============================================================================
# Configuration
# ==============================================================================
configure do
  set :port, 8080
end


# ==============================================================================
# Actions
# ==============================================================================
get '/' do
  t = Tank.new
  if params.has_key?("forward")
    t.forward
  elsif params.has_key?("reverse")
    t.reverse
  elsif params.has_key?("left")
    t.left
  elsif params.has_key?("right")
    t.right
  elsif params.has_key?("stop")
    t.stop
  elsif params.has_key?("clockwise")
    t.clockwise
  elsif params.has_key?("anticlockwise")
    t.anticlockwise
  elsif params.has_key?("up")
    t.up
  elsif params.has_key?("down")
    t.down
  elsif params.has_key?("fire")
    t.fire
  end
  haml :index
end


# ==============================================================================
# Stylesheets
# ==============================================================================
get '/stylesheets/style.css' do
  scss :style
end
