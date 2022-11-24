require_relative "battleship"

require_relative "player"
class Board
    #Part 1
    def initialize (n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n 
    end

    def size
        @size
    end

    def [] (position)
        row = position[0]
        column = position[1]
        @grid[row][column]
    end

    def []=(position, value)
        row = position[0]
        column = position[1]
        @grid[row][column] = value
    end

    def num_ships
        @grid.flatten.count {|value| value == :S}
        # count = 0
        # @grid.each{|row| row.each{|ele| count += 1 if ele == :S}}
        # count
    end

    #PART2
    def attack(position)
        if self[position] == :S
            self[position]= :H 
            puts "you sunk my battleship!"
            return true
        end
        self[position]= :X
        false
    end

    def place_random_ships
        while  self.num_ships < @size/4
            i = rand(0...@grid.length)
            j = rand(0...@grid.length)
            position = i,j
            if self[position] != :S 
                self[position]= :S
            end
        end
    end

    def hidden_ships_grid
        hidden = @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
        hidden
    end

    def self.print_grid(grid)
        puts grid.map{|row|row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
