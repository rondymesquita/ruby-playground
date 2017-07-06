require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require_relative 'app/controllers/book_controller'

class App < Sinatra::Base
  use BookController

  set :bind, '0.0.0.0'
  run! if app_file == $0
end
