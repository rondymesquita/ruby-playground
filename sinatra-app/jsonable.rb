require 'json'
require_relative 'parser'

class JSONable
  def to_json
    HashParser.new.parse_one(self)
  end
end
