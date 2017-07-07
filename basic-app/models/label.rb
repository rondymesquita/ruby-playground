require_relative "abstract_model"

class Label < AbstractModel
  attr_accessor :name

  def initialize(name = 'Programming')
    @name = name
  end

end
