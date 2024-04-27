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
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]            # diagonals

  def initialize
    @squares = {}
    (1..9).each {|key| @squares[key] = Square.new }
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

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.collect(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.collect(&:marker).count(TTTGame::COMPUTER_MARKER)
  end

  # returns winning marker or nil
  def detect_winner
    WINNING_LINES.each do |line|
      if count_human_marker(@squares.values_at(*line)) == 3
        return TTTGame::HUMAN_MARKER
      elsif count_computer_marker(@squares.values_at(*line)) == 3
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def reset
    (1..9).each {|key| @squares[key] = Square.new }
  end
end 

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end
  
  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
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

  def display_board(clear_screen: true)
    clear if clear_screen
    puts "You're a #{human.marker}, computer is a #{computer.marker}."
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

  def display_result
    display_board
    
    case board.detect_winner
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else puts "It was a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def play
    clear
    display_welcome_msg
    loop do
      display_board(clear_screen: false)
      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        display_board
        break if board.someone_won? || board.full?
      end
      display_result
      break unless play_again?
      board.reset
      clear
      puts "Let's play again!"
      puts
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play