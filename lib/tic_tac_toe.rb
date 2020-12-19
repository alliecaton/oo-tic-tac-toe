require 'pry'

class TicTacToe

attr_accessor :board

WIN_COMBINATIONS = [
    [0,1,2], #top across
    [3,4,5], #middle accross
    [6,7,8], #bottom across
    [0,3,6], #left down 
    [1,4,7], #middle down
    [2,5,8], #right down
    [0,4,8],
    [2,4,6]
]

    def initialize(board= nil)
        @board = board || Array.new(9, " ")
    end 

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

     def input_to_index(user_input)
        input = user_input.to_i
        input -= 1
    end 

    def move(index, token= "X")
        @board[index] = token
        display_board
    end 

    def position_taken?(position)
        if @board[position] == " "
            false
        else
            true
        end 
    end

    def valid_move?(position) 
        position.between?(0,8) && board[position] == " "
    end 

    def turn_count
        @board.count("X") + @board.count("O")
    end 

    def current_player
        if self.turn_count.even? 
            "X"
        elsif self.turn_count.odd?
            "O"
        end 
    end

    def turn
        puts "Enter 1-9:"
        input = gets.chomp
        position = self.input_to_index(input)
        player = self.current_player
        if valid_move?(position)
            move(position, player)
        else
            turn
        end 
    end 

    def won?
        WIN_COMBINATIONS.find do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                true 
                combo 
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            true 
            combo 
            else 
                false
            end 
        end 
    end 

    def full? 
        @board.all? { |space| true if space != " "}
    end 
    
    def draw? 
        won? == nil && full? == true
    end 

    def over? 
        draw? || won? || full?
    end 

    def winner
        WIN_COMBINATIONS.find do |combo|
            if (@board[combo[0]] == "X") && (@board[combo[1]] == "X") && (@board[combo[2]] == "X")
                return "X"
            elsif (@board[combo[0]] == "O") && (@board[combo[1]] == "O") && (@board[combo[2]] == "O")
                return "O"
            end 
        end 
    end 

    def play
        until over?
            turn
        end 
        if won? 
            puts "Congratulations #{winner}!"
        elsif draw? 
            puts "Cat's Game!"
        end 
    end 
end 
