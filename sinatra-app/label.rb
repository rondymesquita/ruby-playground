require_relative "JSONable"

class Label < JSONable
  attr_accessor :name

  def initialize(name = "Programming")
    @name = name
  end

end
