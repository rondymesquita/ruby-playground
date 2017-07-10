# frozen_string_literal: true

class Cell
    attr_accessor :row, :column, :grid, :content
    attr_accessor :visited

    def initialize(row, column, content)
        @row = row
        @column = column
        @content = content
        @visited = false
    end

    def check_neighbors(grid)
        neighbors = Array.new
        top = grid[@row - 1][@column]
        right = grid[@row][@column + 1]
        bottom = grid[@row + 1][@column]
        left = grid[@row][@column - 1]

        if !top.nil? && !top.visited && !top.wall?
            return top if top.end?
            neighbors << top
        end

        if !right.nil? && !right.visited && !right.wall?
            return right if right.end?
            neighbors << right
        end

        if !bottom.nil? && !bottom.visited && !bottom.wall?
            return bottom if bottom.end?
            neighbors << bottom
        end

        if !left.nil? && !left.visited && !left.wall?
            return left if left.end?
            neighbors << left
        end

        if neighbors.length > 0
            random = Random.rand(0..neighbors.length-1)
            n = neighbors[random]
            return n
        else

            return nil
        end
    end

    def fill
        @content = "*"
    end

    def unfill
        @content = " "
    end

    def wall?
        return true if @content == '+' || @content == '-' || @content == '|'
        return false
    end

    def start?
        return true if @content == 'S'
        return false
    end

    def end?
        return true if @content == 'E'
        return false
    end

end

class Maze
    @current = nil

    def initialize

        # Represent the whole grid
        @grid = Array.new

        # Represent all the path passed by the 'pointer
        @stack = Array.new

        file = File.read('map2.txt')
        matrix = file.split("\n")

        matrix.each_with_index do |line, row|
            submap = []

            line.split('').each_with_index do |content, column|
                submap << Cell.new(row, column, content)
            end

            @grid << submap
        end
    end

    def paint
        @grid.each do |line|
            line.each do |cell|
                print cell.content
            end
            puts ''
        end
        puts "==================================="
    end

    def start
        @grid.each do |line|
            line.each do |cell|
                if cell.start?
                    @current = cell
                    break
                end
            end
        end
    end

    def solve
        while !@current.end?
            walk
            sleep(0.03)
            paint
        end
    end

    def walk
        @current.visited = true
        @current.fill

        next_cell = @current.check_neighbors(@grid)

        if next_cell != nil
            next_cell.visited = true
            @stack << @current
            @current = next_cell
        elsif @stack.length > 0
            #dead-end
            @grid[@current.row][@current.column].unfill
            @current = @stack.pop

        end
    end

end

m = Maze.new
m.paint

m.start
m.solve

m.paint
