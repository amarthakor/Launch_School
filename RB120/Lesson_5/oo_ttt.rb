require 'pry'
=begin
Object Oriented Tic Tac Toe
- Write a description of the problem and extract major nouns and verbs.
- Make an initial guess at organizing the verbs into nouns and do a spike to explore 
  the problem with temporary code.
- Optional - when you have a better idea of the problem, model your thoughts into CRC cards.


Nouns and Verbs
--------------------------
Tic Tac Toe is a game played by two players on a 3x3 grid. One player marks an 'X'
and the other player marks an 'O'. The first player to get 3 marks in a row in any
direction (veritcal, diagonal, or horizontal) wins.

Nouns: board, player, square, grid
Verbs: play, mark

Board
Square
Player
  - play
  - mark


=end

# Spike exploration

class Board
  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new(INITIAL_MARKER) }
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end
end 

class Square
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
  end
  
  def to_s
    @marker
  end

  def unmarked?
    marker == Board::INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end

end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = "O"
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_msg
    puts "Welcome to Tic Tac Toe!"
    puts
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def human_moves
    puts "Chose a square #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Invalid choice, select from #{board.unmarked_keys.join(', ')}"
    end
    
    board.set_square_at(square, human.marker)
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, goodbye!"
  end

  def display_board
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.
      get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.
      get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.
      get_square_at(9)}"
    puts "     |     |"
    puts
  end

  def play
    display_welcome_msg
    display_board
    loop do
      human_moves
      # break if someone_won? || board_full?

      computer_moves
      display_board
      # break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play