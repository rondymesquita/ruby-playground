class Cell
    attr_accessor :row, :column, :content, :visited

    def initialize(row, column)
        @row = row
        @column = column
        @content = "#"
        @visited = false
    end

    def visited?
        @visited
    end

    def end?
        return true if @content == "E"
        return false
    end

    def open
        @content = " "
    end

    def find_neighbor(grid)
        neighbors = Array.new
        top = grid[@row - 1][@column]
        right = grid[@row][@column + 1]
        bottom = grid[@row + 1][@column]
        left = grid[@row][@column - 1]

        if !top.nil? && !top.visited
            neighbors << top
        end

        if !right.nil? && !right.visited
            neighbors << right
        end

        if !bottom.nil? && !bottom.visited
            neighbors << bottom
        end

        if !left.nil? && !left.visited
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
end

class MazeGenerator

    def initialize(size)
        @rows = size
        @columns = size
        @cell_content = "#"
        @grid = Array.new
        @current = nil

    end

    def setup
        for row in 0..@rows + (@rows)
            submap = Array.new
            for column in 0..@columns + (@columns)
                submap << Cell.new(row, column)
            end
            @grid << submap
        end

        @start = @grid[1][0]
        @end = @grid[ @grid.length - 2][ @grid.length - 1]

        # set start and end
        @start.content = "S"
        @end.content = "E"
    end

    def generate
        setup
        @current = @start
        # while !@current.end?
        #     walk
        #     sleep(0.03)
        #     draw
        # end
    end


    def walk
        @current.visited = true
        @current.open
        next_cell = @current.find_neighbor(@grid)

        if !next_cell.nil?
            next_cell.visited = true
            @current = next_cell
        end

    end

    def draw
        @grid.each do |line|
            line.each do |cell|
                print cell.content
            end
            puts ''
        end
        puts ''
    end

end

g = MazeGenerator.new(5)
g.generate
g.draw
