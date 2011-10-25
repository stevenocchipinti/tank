require 'sinatra'
require 'haml'
require 'sass'
require 'coffee-script'
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
    time = params.has_key?("time") ? params["time"].to_i : 2
  end

  # Control the tank!
  t = Tank.new
  if params.has_key?("action")
    case params["action"]
    when "forward"
      t.forward(time)
    when "reverse"
      t.reverse(time)
    when "left"
      t.left(time)
    when "right"
      t.right(time)
    when "stop"
      t.stop
    when "clockwise"
      t.clockwise(time)
    when "anticlockwise"
      t.anticlockwise(time)
    when "up"
      t.up(time)
    when "down"
      t.down(time)
    when "fire"
      t.fire
    end
  end

  # Render a view
  haml :index
end


# ==============================================================================
# Javascripts / Coffeescripts
# ==============================================================================
get '/js/tank.js' do
  coffee :tank
end


# ==============================================================================
# Stylesheets
# ==============================================================================
get '/css/style.css' do
  scss :style
end


# ==============================================================================
# Helpers
# ==============================================================================
helpers do
  def checkbox_tag(checked, options={})
    options['checked'] = 'checked' if checked
    haml "%input#{options.to_s}"
  end
end
