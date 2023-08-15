# rock paper scissors game where:
# user makes a choice
# computer makes a choice
# winner is determined
# option to repeat?

# inputs: - user choice of R/P/S
#         - repeat?
# outputs: - computer choice of R/P/S
#          - winner displayed

# PEDAC
# Greet user
# Ask user for r/p/s choice
# computer picks r/p/s choice
# winner is displayed
# ask user if they would like to repeat

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
  if  (player == 'rock' && computer == 'scissors') ||
    (player == 'paper' && computer == 'rock') ||
    (player == 'scissors' && computer == 'paper')
  prompt("You won!")
elsif (player == 'rock' && computer == 'paper') ||
      (player == 'paper' && computer == 'scissors') ||
      (player == 'scissors' && computer == 'rock')
  prompt("You lose!")
else (player == 'rock' && computer == 'rock') ||
    (player == 'paper' && computer == 'paper') ||
    (player == 'scissors' && computer == 'scissors')
  prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please enter a valid choice")
    end
  end

  computer = VALID_CHOICES.sample
  prompt("You chose #{choice}; computer chose #{computer}")

  display_results(choice, computer)

  prompt("Would you like to play again?")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt("Thank you for playing, good bye!")