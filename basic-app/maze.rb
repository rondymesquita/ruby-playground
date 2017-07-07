# frozen_string_literal: true

class Position
    attr_reader :row, :column

    def initialize(row, column)
        @row = row
        @column = column
    end

end

LEFT = [0][-1]
RIGHT = [0][1]
UP = [-1][0]
DOWN = [1][0]

class Maze

    @paths = []

    def initialize
        file = File.read('map.txt')
        matrix = file.split("\n")
        @map = []
        matrix.each_with_index do |line, column|
            submap = []
            line.split('').each_with_index do |point, row|
                # pus "#{column+1} : #{row+1} : #{point}"
                submap << point
            end
            @map << submap
        end
    end

    def paint
        @map.each do |line|
            line .each do |point|
                print point
            end
            puts ''
        end
    end

    def solve
        walk("point", RIGHT)
        @map.each do |line|
            line .each do |point|
                print point
            end
            puts ''
        end
    end

    def walk(point, direction)
        return if end? point
        return if wall? point
        # resolve
    end

    def process_point
        if wall? point
            return
        end
    end

    def wall?(point)
        return true if point == '+' || point == '-'
        return false
    end

    def start?(point)
        return true if point == 'S'
        return false
    end

    def end?(point)
        return true if point == 'E'
        return false
    end

    private :process_point

end

m = Maze.new
m.paint
m.solve
puts "solved"
m.paint
