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