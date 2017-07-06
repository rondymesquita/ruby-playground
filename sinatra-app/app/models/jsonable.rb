require 'json'
require_relative '../helpers/parser'

class JSONable
  def to_json
    HashParser.new.parse_one(self)
  end
end
