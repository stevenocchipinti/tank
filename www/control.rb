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
  haml :index
end

post '/' do
  t = Tank.new
  if params.has_key?("action")
    case params["action"]
    when "forward"
      t.forward(params['duration'].to_i)
    when "reverse"
      t.reverse(params['duration'].to_i)
    when "left"
      t.left(params['duration'].to_i)
    when "right"
      t.right(params['duration'].to_i)
    when "stop"
      t.stop
    when "clockwise"
      t.clockwise(params['duration'].to_i)
    when "anticlockwise"
      t.anticlockwise(params['duration'].to_i)
    when "up"
      t.up(params['duration'].to_i)
    when "down"
      t.down(params['duration'].to_i)
    when "fire"
      t.fire
    end
  end
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
