require './board.rb'
class HumanPlayer

    def initialize(mark_value)
        @mark = mark_value
    end

    attr_accessor :mark

    def get_position
        puts "Player #@mark: Enter a position:"
        position = *args = gets.chomp.split(" ").map {|num| num.to_i}
    end
end