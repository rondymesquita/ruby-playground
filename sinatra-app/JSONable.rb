require 'json'
class JSONable
  def to_json
    hash = {}
    instance_variables.each do |var|
      value = instance_variable_get var

      hash[var.to_s[1..-1]] = if value.class == Array
                                parse_list value
                              else
                                value
                              end
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
