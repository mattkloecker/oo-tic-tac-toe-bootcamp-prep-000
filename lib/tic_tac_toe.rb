class TicTacToe

 #instance of the game sets a starting board aka empty array
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #combinations of wins
  WIN_COMBINATIONS = [
    [0,1,2], #top row win
    [3,4,5], #middle row win
    [6,7,8], #bottom row win
    [0,3,6], #left column win
    [1,4,7], #middle column win
    [2,5,8], #right column win
    [0,4,8], #left diagnonal win
    [2,4,6], #right diagonal win
  ]

#displays the board based on @board instance variable
  def display_board
    rows = [" #{@board[0]} | #{@board[1]} | #{@board[2]} ",\
    " #{@board[3]} | #{@board[4]} | #{@board[5]} ",\
    " #{@board[6]} | #{@board[7]} | #{@board[8]} "]
    puts "#{rows[0]}\n-----------\n#{rows[1]}\n-----------\n#{rows[2]}"

  end

  #take player input convert to integer
  def input_to_index(input)
    input=(input.to_i) - 1;
  end

  #execute player move, given index of @board array and player's token
  def move(index, value = "X")
    return @board[index] = value
  end

  #check if requested position is taken or empty
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  #check if a move is valid
def valid_move?(index)
  if @board[index] == "" || @board[index] == " " && index.between?(0, 8)
    return true
  elsif @board[index] == "X" || @board[index] == "O"
    return false
  end
end

#count number of turns played
def turn_count
    counter = 0
  @board.each do |space|
    if space == "X" || space == "O";
      counter += 1;
    end
  end
  counter
end

#check the current player
def current_player
  if turn_count&1==0 || turn_count == 0;
    return "X"
  else
    return "O"
  end
end

#check if game has been won
def won?(board)
 WIN_COMBINATIONS.each do |win_index| #interates thru list of win combinations array

   x_win = win_index.all? do |spot| #interates thru individual win array

     @board[spot] == "X"

   end

   o_win = win_index.all? do |spot|

    @board[spot] == "O"

   end

        if x_win || o_win

          return win_index

        end
    end
  else
    return false
end


#executes a turn
def turn
        puts "Please enter 1-9:";
        input = gets.strip;
        index = input_to_index(input);
        value = current_player()
      if (valid_move?(index))
        move(index, value);
        display_board();
      else
        turn;
      end
end











#end of class TicTacToe
end
