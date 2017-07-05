class Person
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def to_s
		"name: #{@name}"
	end
end

class Programmer < Person
	attr_accessor :language

	def initialize(name, language)
		super name
		@language = language
	end

	def say_hi
		"Hi, my name is #{@name} and I am a #{@language} programmer" 
	end
end


rondy = Programmer.new "Rondy", "Ruby"
puts rondy.name
puts rondy.say_hi
