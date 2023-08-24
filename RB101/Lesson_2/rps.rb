
VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def opening_prompt_
  prompt("Welcome to rock, paper, scissors, lizard, spock!
   In this game we will be competing against each other
   The rules are simple - first to win 3 rounds will be declared the
   winner")
end

def winner(player, computer)
  prompt("You win!") if
  (player == 'rock' && computer == 'scissors') ||
  (player == 'paper' && computer == 'rock') ||
  (player == 'scissors' && computer == 'paper')
end

def loser(player, computer)
  prompt("You lose!") if
  (player == 'rock' && computer == 'paper') ||
  (player == 'paper' && computer == 'scissors') ||
  (player == 'scissors' && computer == 'rock')
end

def tie(player, computer)
  prompt("It's a tie!") if
  (player == 'rock' && computer == 'rock') ||
  (player == 'paper' && computer == 'paper') ||
  (player == 'scissors' && computer == 'scissors')
end

def display_results(player, computer)
  winner(player, computer)
  loser(player, computer)
  tie(player, computer)
end

opening_prompt_

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
