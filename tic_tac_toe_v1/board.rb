class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        row = position[0]
        column = position[1]
        if 2 < row  || row < 0 || 2 < column || column < 0 || position.length != 2
            puts "out of bounds"
            return false
        end
        return true
    end

    def empty?(position)
        row = position[0] 
        column = position[1] 
        @grid[row][column] == "_" 
    end

    def place_mark(position, mark)
        return false if !valid?(position) || !empty?(position)
        row = position[0]
        column = position[1]
        @grid[row][column] = mark
        true
    end

    def print
        @grid.each {|row| puts row.join(" ")}
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|ele| ele == mark}}
    end

    def win_col?(mark)
        (0..2).any? {|i| @grid.each_index.all? {|j| @grid[i][j] == mark}}
    end

    def win_diagonal?(mark)
        return true if @grid.each_index.all? {|i| @grid[i][i] == mark}
        i = 0 
        j = 2
        count = 0
        while i < 3
            count += 1 if @grid[i][j] == mark 
            return true if count == 3
            i += 1
            j -=1
        end
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any?{|i| i.any?{|j| self.empty?(i,j)}}
    end



end