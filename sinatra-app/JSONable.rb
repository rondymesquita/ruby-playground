require "json"
class JSONable

def to_json
  hash = Hash.new
  self.instance_variables.each do |var|
     hash[var.to_s[1..-1]] = self.instance_variable_get var
     puts var
  end
  hash
end

  def parse_list(list_to_parse)
    list = []
    list_to_parse.each do |item|
      list << item.to_json
    end
    list
  end
end
