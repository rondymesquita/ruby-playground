require_relative 'jsonable'

class Label < JSONable
  attr_accessor :name

  def initialize(name = 'Programming')
    @name = name
  end

end
