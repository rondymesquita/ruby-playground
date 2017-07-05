class HashParser
  def parse_one(one_to_parse)
    hash = {}
    one_to_parse.instance_variables.each do |var|
      value = one_to_parse.instance_variable_get var

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
      list << parse_one(item)
    end
    list
  end
end
