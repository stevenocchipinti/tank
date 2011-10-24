require 'sinatra'
require 'haml'
require 'sass'
require_relative 'Tank'

# ==============================================================================
# Configuration
# ==============================================================================
configure do
  set :port, 80
end


# ==============================================================================
# Actions
# ==============================================================================
get '/' do

  # Check to see if the actions should be persistent
  time = nil
  unless params.has_key?("sticky")
    time = params.has_key?("time") ? params["time"] : 2
  end

  # Control the tank!
  t = Tank.new
  if params.has_key?("forward")
    t.forward(time)
  elsif params.has_key?("reverse")
    t.reverse(time)
  elsif params.has_key?("left")
    t.left(time)
  elsif params.has_key?("right")
    t.right(time)
  elsif params.has_key?("stop")
    t.stop
  elsif params.has_key?("clockwise")
    t.clockwise(time)
  elsif params.has_key?("anticlockwise")
    t.anticlockwise(time)
  elsif params.has_key?("up")
    t.up(time)
  elsif params.has_key?("down")
    t.down(time)
  elsif params.has_key?("fire")
    t.fire
  end

  # Render a view
  haml :index
end


# ==============================================================================
# Stylesheets
# ==============================================================================
get '/stylesheets/style.css' do
  scss :style
end
