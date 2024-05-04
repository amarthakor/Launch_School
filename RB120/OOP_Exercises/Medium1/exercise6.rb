=begin

Create an object-oriented number guessing class for numbers in the range
1 to 100, with a limit of 7 guesses per game. The game should play like this:


game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number 
to guess with each call to #play.

game = GuessingGame.new
game.play

=end

# Create a number guessing class of a random number from 1-100
# 7 guess per game
# flow of game 
    #   - amount of guesses remaining
    # - Direction to enter a number ebtween 1 and 100
    # - If guess is out of range, show error and retry
    # - If guess is incorrect, tell player if their guess is too low or too high
    # - If player guess number, inform them that they are correct
    # - Finally tell palyer they won if they guessed correctly, or tell them
    #   they ran out of guesses and have lost the game

    # guesses_remaining
    # enter_number > loop construct for guess validation
    # correct_guess? > breaks loop to exit game
    # too_high or too_low
    # end_result > should be out of main game loop

    # perhaps extract steps 1-4 into a #main_game loop?

class GuessingGame
  attr_accessor :guesses, :guess
  attr_reader :random_number

  def initialize
    @guesses = 7
    @random_number = rand(0..100)
    @guess = nil
  end

  def guesses_remaining # need to exit main game loop if guesses_remaining reaches 0
    puts "You have #{guesses} guesses remaining."
    self.guesses -= 1
  end

  def enter_number # will need to contain loop within to validate input
    puts "Enter a number between 1 and 100"
 
    loop do
      self.guess = gets.chomp.to_i
      break if guess >= 1 && guess <=100
      puts "Invalid guess. Enter a number between 1 and 100"
    end
    guess
  end

  def out_of_guesses?
    guesses == 0
  end

  def correct_guess?
    if guess == random_number
      puts "Thats the number!"
    elsif guess > random_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
    puts
  end

  def winner
    guess == random_number
  end

  def end_result
    if winner
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def main_game_loop # loop main gameplay into one method
    loop do
      guesses_remaining
      enter_number
      correct_guess?
      break if winner || out_of_guesses?
    end
  end

  def play # will contains all steps of game into one to play game smoothly
    main_game_loop
    end_result
  end
end

game = GuessingGame.new
game.play