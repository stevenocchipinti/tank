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
    logger.info "Moving forward"
    t.forward
  elsif params.has_key?("reverse")
    logger.info "Moving backwards"
    t.reverse
  elsif params.has_key?("left")
    logger.info "Turning left"
    t.left
  elsif params.has_key?("right")
    logger.info "Turning right"
    t.right
  elsif params.has_key?("stop")
    logger.info "Stopping"
    t.stop
  elsif params.has_key?("clockwise")
    logger.info "Rotating clockwise"
    t.clockwise
  elsif params.has_key?("anticlockwise")
    logger.info "Rotating anticlockwise"
    t.anticlockwise
  elsif params.has_key?("up")
    logger.info "Raising canon"
    t.up
  elsif params.has_key?("down")
    logger.info "Lowering canon"
    t.down
  elsif params.has_key?("fire")
    logger.info "Firing canon"
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
