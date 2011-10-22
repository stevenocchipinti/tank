require 'sinatra'
require 'haml'
require 'sass'

get '/' do
  haml :index
end


get '/stylesheets/style.css' do
  scss :style
end
