require_relative 'book'
require_relative 'parser'

class BookService
  def list
    label_programming = Label.new('Programming')
    label_ruby = Label.new('Ruby')
    label_js = Label.new('Javascript')

    book_ruby = Book.new('Ruby', 2016, true, [label_programming, label_ruby])

    book_js = Book.new('Javascript', 2016, false, [label_js])

    books = [book_ruby, book_js]
    parser = HashParser.new
    books = parser.parse_list books
    books
  end

  def one
    label_programming = Label.new('Programming')
    label_ruby = Label.new('Ruby')
    book_ruby = Book.new('Ruby', 2016, true, [label_programming, label_ruby])

    parser = HashParser.new
    books = parser.parse_one book_ruby
    books
  end
end
