require 'sinatra'
require_relative '../models/label'
require_relative '../services/book_service'
require 'json'

class BookController < Sinatra::Base

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
end
