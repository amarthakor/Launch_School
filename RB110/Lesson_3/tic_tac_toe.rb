# tic tac toe is a game that is composed of a 3x3 grid, for 9 total grid-spots,
# takes takes 2 players. The players take turns marking the board, the first
# player to mark 3 spots in a row, column, or diagonal line wins. If all 9
# spots are marked with no 3 in a rows, the game ends in a tie.

# flow chart
#
# 1 display 3x3 board
# 2 user makes turn and marks a gridspot
# 3 computer makes turn and marks a gridspot
# 4 display the updated board state.
# 5 check to see if any 3 in rows
#   if true, declare winner
# 6 check to see if board is full
#   if true, declare tie
# 7 if neither winner nor board is full, repeat steps 2-6
# 8 ask if user wants to play again
#   if yes, repeat steps 2-6
#   if no, end game
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontal wins
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # vertical wins
                [[1, 5, 9], [3, 5, 7]]              # diagonal wins

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/ MethodLength, Metrics/ AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/ MethodLength, Metrics/ AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_takes_turn!(brd)
  tile = 0
  loop do
    prompt "Please mark a tile! #{joinor(brd)}"
    tile = gets.chomp.to_i
    break if empty_squares(brd).include?(tile)
    prompt "Sorry, that is an invalid choice!"
  end

  brd[tile] = PLAYER_MARKER
end

def computer_takes_turn!(brd)
  prompt "Now it's computers turn!"
  tile = empty_squares(brd).sample
  brd[tile] = COMPUTER_MARKER
  display_board(brd)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def play_again?
  prompt "Would you like to play again? Press 'Y' to restart"
  gets.chomp.upcase
end

def select_values(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(brd)
  if select_values(brd).size <= 2
    select_values(brd).join(', ')
  else
    select_values(brd).insert(-2, 'or').join(', ')
  end
end

def display_winner(player, computer)
  if player == 5
    prompt "You've won!!!"
  elsif computer == 5
    prompt "Oh no, you lost and computer won!"
  else
    prompt "It's a tie!!"
  end
end

prompt "Welcome to tic tac toe! The first player to get three in a row of any
        row, coloumn, or diagonal line, for a total of 5 times wins!"
sleep(8)

# begin program execution
loop do
  board = initialize_board

  player = 0
  computer = 0
  # main code loop
  loop do
    display_board(board)
    prompt "Your score: #{player}! Computer score: #{computer}!"

    player_takes_turn!(board)
    if winner?(board)
      player += 1
      break if player >= 5
      board = initialize_board
      next
    elsif board_full?(board)
      board = initialize_board
      next
    end

    computer_takes_turn!(board)
    if winner?(board)
      computer += 1
      break if computer >= 5
      board = initialize_board
    elsif board_full?(board)
      board = initialize_board
    end
  end

  display_board(board)

  display_winner(player, computer)

  answer = play_again?
  break if !answer.start_with?('Y')
end

prompt "Thanks for playing tic tac toe, goodbye!"
