class HashParser
  def parse_one(one_to_parse)
    hash = {}
    one_to_parse.instance_variables.each do |var|
      value = one_to_parse.instance_variable_get var

      if value.class == Array
        hash[var.to_s[1..-1]] = parse_list value
      else
        hash[var.to_s[1..-1]] = value
      end

    end
    hash
  end

  def parse_list(list_to_parse)
    list = []
    list_to_parse.each do |item|
      list << parse_one(item)
    end
    list
  end
end
