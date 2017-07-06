require_relative 'app/models/book'
require_relative 'app/models/label'

label_programming = Label.new('Programming')
label_ruby = Label.new('Ruby')
label_js = Label.new('Javascript')

book_ruby = Book.new('Ruby', 2016, true, [label_programming, label_ruby])
book_js = Book.new('Javascript', 2016, false, [label_js])

def book_ruby.rubish
	puts "Im rubish"
end

# book_js.rubish

module Printer
	class HP
		attr_accessor :name
	end
end

printer = Printer::HP.new
printer.name = "Fulano"
p printer
