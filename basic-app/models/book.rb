require_relative "abstract_model"
require_relative 'label'

class Book < AbstractModel
  attr_reader :title, :year, :public_domain, :labels

  def initialize(title = 'Ruby', year = 2016, public_domain = true, labels = nil)
    @title = title
    @year = year
    @public_domain = public_domain
    @labels = labels
  end
end
