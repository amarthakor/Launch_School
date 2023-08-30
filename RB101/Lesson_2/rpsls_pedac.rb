# ------------- PEDAC ------------
# P:
#   inputs: 
#           user makes choice
#           user chooses to play again or not
#  outputs:
#           welcome message w/ rules explanation
#           computers choice is displayed
#           winner is displayed
#           display win total for user and computer
#           declare grand winner
#           goodbye message
#  clarifying rules:
#           - rock > scissors & lizard
#           - scissors > paper & lizard
#           - paper > rock & spock
#           - lizard > paper & spock
#           - spock > rock & scissors
#           - possible valid choices are limited to RSPLS
#           - RSPLS choice will be entered by user via valid abbreviation
#           - first to 3 wins is the grand winner
#  mental model:
#           Game in which two players, the user and computer, face off against
#           each other. There are 5 possible "moves" a player can choose from
#           consisting of RPSLS; there are 3 possible outcomes for a player:
#           win, lose, or tie. The first player to win 3 rounds in total is
#           declared the grand winner of the game

# E:
#  player1(rock) vs player2(scissors) = player1 wins
#  player1(spock) vs player2(paper) = player2 wins
#  player1(paper) vs player2(paper) = tie
#  player1(2wins) vs player2(3wins) = player2 grand winner
#  player1(cheese) vs player2(paper) = not valid choice

# D:
#   hash

# A: 
#   - Set VALID_CHOICES variable to hash, where hash consists of keys equal to
#     shorthand abbrev of valid answer choices (i.e. 'r' for 'rock')
#   - Define helper methods for winner, loser, and tie that will print a
#     corresponding prompt if == true
#   - Define method to compare results of winner/loser/tie method to print out
#     match outcome
#   - Greet player
#   - Explain rules of game and conditions to win
#   - Create main loop for overall game, then create second loop for
#     multiple rounds of game
#   - set choice = '', then create new loop
#   - player chooses move w/ choice = gets.chomp.
#   - compare hash VALID_CHOICES.include?(choice) for appropriate answer
#   - if valid choice, break, otherwise prompt player to choose valid option
#   - computer chooses valid choice
#   - display winner result of round
#   - set player_win_count = 0, computer_win_count = 0
#   - if result of round == win, player_win_count +1 
#   - if result of round == lose, computer_win_count +1
#   - display total win counts for both player and computer
#   - break loop when player || computer == 3
#   - display grand winner
#   - ask player if they'd like to play again?
#   - if answer == Yes/Y, restart new game, otherwise end loop
#   - thank player for playing and end program
