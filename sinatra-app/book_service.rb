require_relative "book"

class BookService
  def list()
    rubyBook = Book.new("Ruby", 2016)
    jsBook = Book.new("Javascript", 2016)

    books = [rubyBook, jsBook]
    return books
  end
end
