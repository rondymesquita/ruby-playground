# frozen_string_literal: true

require_relative 'models/book'
require_relative 'models/label'

def creating_objects
  label_programming = Label.new('Programming')
  label_ruby = Label.new('Ruby')
  label_js = Label.new('Javascript')

  book_ruby = Book.new('Ruby', 2016, true, [label_programming, label_ruby])
  book_js = Book.new('Javascript', 2016, false, [label_js])

  # method for a single instance and only
  def book_ruby.rubish
    puts 'Im rubish'
  end

  book_ruby.rubish
  p book_ruby
  # book_js&.rubish
end

def string_interpolation
  name = "Rondy"
  puts "My name is #{name}"
end

def repetitions
  colors = []
  colors << 'red'
  colors << 'blue'

  for i in 0..1
    puts colors[i]
  end

  colors.each do |color|
    puts color
  end
end

def repetitions_of_objects
  books = []
  books << Book.new('Ruby', 2016, true, nil)
  books << Book.new('Javascript', 2016, false, nil)

  books.each do |book|
    p book
  end
  books.each_with_index do |book, index|
    p book
    puts index
  end
end

def keep_talking
  loop do
    text = gets.strip
    puts text
    break if %w[exit].include? text.downcase
  end
end

def recursive_example_one(count)
  return if count.zero?
  puts count
  count -= 1
  recursive_example_one(count)
end

class Person
    attr_accessor :id
    def initialize(name)
        @name = name
    end

    def say_name
        puts @name
    end
end

def grid
    grid = []
    for i in 0..5
      line = []
      for j in 0..5
        line << Person.new("#{i} : #{j}")
      end
      grid << line
    end

    el = grid[1][7]
    if !el.nil?
        p el.say_name
    end
end

# creating_objects
# string_interpolation
# repetitions
# repetitions_of_objects
# keep_talking
# recursive_example_one(5)
grid
