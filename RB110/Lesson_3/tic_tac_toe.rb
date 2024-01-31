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

def prompt(message)
  puts "=> #{message}"
end

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
    prompt "Please mark a tile! #{empty_squares(brd).join(', ')}"
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
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontal wins
                  [[1, 4, 7], [2, 5, 8], [3, 6, 8]] + # vertical wins
                  [[1, 5, 9], [3, 5, 7]]              # diagonal wins

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def play_again?
  prompt "Would you like to play again? Press 'Y' to restart"
  gets.chomp.upcase
end

# begin program execution
loop do
  board = initialize_board

  # main code loop
  loop do
    display_board(board)

    player_takes_turn!(board)
    break if winner?(board) || board_full?(board)

    computer_takes_turn!(board)
    break if winner?(board) || board_full?(board)
  end

  display_board(board)

  if winner?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  answer = play_again?
  break if !answer.start_with?('Y')
end

prompt "Thanks for playing tic tac toe, goodbye!"
