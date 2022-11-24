require './board.rb'
require './human_player.rb'

class Game 

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
        @mark = @current_player.mark
    end

    

    def switch_turn
        if @current_player == @player_1
            @current_player == @player_2
            @mark = @current_player.mark
        else
            @current_player == @player_1
            @mark = @current_player.mark
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            while  !@board.place_mark(@current_player.get_position, @current_player.mark)
                @board.print
                @board.place_mark(@current_player.get_position, @current_player.mark)
            end
            if @board.win?(@current_player.mark)
                @board.print
                puts "Player #@mark wins!"
                return
            end
            self.switch_turn
        end
        puts "draw"
    end
end

Game.new(:X, :O).play