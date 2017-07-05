require_relative "JSONable"

class Label < JSONable
  attr_accessor :name

  def initialize(name = "Programming")
    @name = name
  end

  # def to_json
  #   hash = Hash.new
  #   hash = {:name => @name}
  #   hash
  # end
end
