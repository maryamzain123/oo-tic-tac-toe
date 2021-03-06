class TicTacToe
    
    def initialize 
       @board = [" ", " ", " ", " ", " "," ", " ", " ", " "]
    end
    
    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0,3,6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4 ,6]
    ]

    def display_board

        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts " -----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts " -----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        # if @board[index] == " "
        #     false
        # else
        #     true
        # end
        @board[index] != " "
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        @board.count{ | turn | turn != " "}
    end

    def current_player
        # if turn_count.even?
        #     "X"
        # else
        #     "O"
        # end
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Please select a square (1-9):"
        # get user input
        input = gets.strip
        #since all user input comes in as a string from terminal,convert to integar and substract 1
        index = input_to_index(input)
        # check to see if its a valid move
        # if so let them make a move if not ask the mto choose again
        if valid_move?(index)
            token = current_player
            move(index, token)
        else
            turn
        end
        display_board
    end



    def won?
        WIN_COMBINATIONS.any? do | winning |
            if position_taken?(winning[0]) && @board[winning[0]] == @board[winning[1]] && @board[winning[1]] == @board[winning[2]]
            return winning
        end
    end
    end

    def full?
        if @board.all? { | spaces | spaces != " "}
            true
        else
            false
        end
    end

        def draw?
            !won? && full?
        end
        def over?
            won? || full? || draw? 
        end

        def winner
            if won?
                winning = won?
                winner = @board[winning[0]]
            else
                nil
            end
        end


        def play
            until over?
                turn
            end
            if won? 
                puts "Congratulations #{winner}!"
            else
                draw?
                puts "Cat's Game!"
            end
        end


end
