require_relative "JSONable"
require_relative "label"

class Book < JSONable
  attr_reader :title, :year, :public_domain, :labels

  def initialize(title = "Ruby", year = 2016, public_domain = true, labels = nil)
    @title = title
    @year = year
    @public_domain = public_domain
    @labels = labels
  end

  # def to_json
  #   hash = Hash.new
  #   hash = {:title => @title, :year => @year, :public_domain => @public_domain, :labels => parse_list(@labels)}
  #   hash
  # end

end
