require "pry"
class TicTacToe
    attr_accessor :index
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]
    def initialize
        @board = Array.new(9, " ")
        @index = index
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(string)
        @index = string.to_i
        @index = index - 1
        # binding.pry
    end
    def move(index, player_token = "X")
        @board[index] = player_token
    end

    def position_taken?(index)
        !(@board[index].nil? || @board[index] == " ")
    end
      
    def valid_move?(index)
        # if @board[index].include? "X" || "O"
        #     return false
        if position_taken?(index)
            return false
        elsif index > 8 || index < 0
            return false
        else 
            return true
        end
    end

    def turn_count
        turn = 0
        @board.each do |index| 
            if index == "X" || index == "O"
                turn +=1
            end
        end
        turn
    end
    def current_player
        if turn_count.even?
            return "X"
        else
            return "O"
        end
    end

    def turn
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
            token = current_player
            move(index, token)
            display_board
        else
            turn
        end
    end


  
    def won?
        x_index = 0
        o_index = 0
        if WIN_COMBINATIONS.each do |win_combo|
            win_combo.each do |index|
                if @board[index] == "X"
                    x_index += 1
                elsif @board[index] == "O"
                    o_index += 1
                end
            end
                 if x_index == 3 || o_index == 3
                    return win_combo
                 else
                    x_index = 0 && o_index = 0
                 end
            end
        end
        return false
    end
    # binding.pry
    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end


    def draw?
        if full? && !won?
            return true
        else
            return false
        end
    end
    def over?
        if draw? || won?
            true
        else
            false
        end
    end

    def winner
        if won? != false
            @board[won?[0]]
        else
            nil
        end
    end

    def play
        until over? == true
            turn
        end
    if won?
        puts "Congratulations #{winner}!"
    else
        puts "Cat's Game!"
    end
end

end