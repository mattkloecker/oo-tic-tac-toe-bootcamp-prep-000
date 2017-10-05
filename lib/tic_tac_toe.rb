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

  #execute player move
  def move(index, value = "X")
    return @board[index] = value
  end











#end of class TicTacToe
end
