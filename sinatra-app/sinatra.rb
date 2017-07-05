require 'sinatra'
require 'sinatra/json'

require_relative "hello"
require_relative "label"
require_relative "book_service"
require "json"

set :bind, "0.0.0.0"

book_service = BookService.new

get '/' do
  content_type :json
  labelProgramming = Label.new("Programming")
  labelTechnology = Label.new("Technology")
  labels = [labelProgramming, labelTechnology]
  rubyBook = Book.new("Ruby", 2016, true, ["a","s"])
  json rubyBook.to_json
end
