# frozen_string_literal: true

class Cell
    attr_accessor :row, :column, :grid, :content, :visited

    def initialize(row, column, content)
        @row = row
        @column = column
        @content = content
        @visited = false
    end

    def visited?
        @visited
    end

    def get_neighbors(grid)
        neighbors = Array.new
        top = grid[@row - 1][@column]
        right = grid[@row][@column + 1]
        bottom = grid[@row + 1][@column]
        left = grid[@row][@column - 1]

        if !top.nil? && !top.visited && !top.wall?
            neighbors << top
        end

        if !right.nil? && !right.visited && !right.wall?
            neighbors << right
        end

        if !bottom.nil? && !bottom.visited && !bottom.wall?
            neighbors << bottom
        end

        if !left.nil? && !left.visited && !left.wall?
            neighbors << left
        end

        if neighbors.length > 0
            return neighbors
        else
            return nil
        end
    end

    def fill
        @content = "*"
    end

    def unfill
        @content = " " if !wall? && !start? && !end?
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

        file = File.read('map.txt')
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
        sleep(0.03)
        puts "==================================="
    end

    def solve
        @current = get_start_cell
        walk(@grid, @current, @stack)
        # while !@current.end?
        #     walk(@grid, @current, @stack)
        #     sleep(0.03)
        #     paint
        # end
    end

    def print_solution
        @stack.each do |cell|
            print "#{cell.row} : #{cell.column}\n"
        end
    end

    private
    def get_start_cell
        @grid.each do |line|
            line.each do |cell|
                if cell.start?
                    return cell
                end
            end
        end
        return nil
    end

    def walk(grid, current, stack)

        return current if current.end?

        current.visited = true
        current.fill
        stack << current
        paint

        neighbors = current.get_neighbors(grid)
        if neighbors == nil
            return
        end

        neighbors.each do |n|
            c = walk(grid, n, stack)
            return if !c.nil?
        end

        # if next_cell != nil
        #     next_cell.visited = true
        #     next_cell.fill
        #     stack << current
        #     current = next_cell
        #     paint
        #     walk(grid, current, stack)
        # elsif stack.length > 0
        #     #dead-end
        #     # return
        #     grid[current.row][current.column].unfill
        #     current = stack.pop
        #     # walk(grid, current, stack)
        #     return
        # end
    end

    def walk_solution
        @grid.each do |line|
            line.each do |cell|
                cell.unfill
            end
        end
        @stack.each do |cell|
            @grid[cell.row][cell.column].fill
            sleep(0.03)
            paint
        end
    end

end

m = Maze.new
m.solve
