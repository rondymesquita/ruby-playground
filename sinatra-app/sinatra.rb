require 'sinatra'
require 'sinatra/json'

require_relative 'hello'
require_relative 'label'
require_relative 'book_service'
require 'json'

set :bind, '0.0.0.0'

book_service = BookService.new

get '/list' do
  content_type :json
  books = book_service.list
  json books
end

get '/one' do
  content_type :json
  book = book_service.one
  json book
end
