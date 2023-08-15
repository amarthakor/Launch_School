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

  computer_choice = VALID_CHOICES.sample
  prompt("You chose #{choice}; computer chose #{computer_choice}")

  if  (choice == 'rock' && computer_choice == 'scissors') ||
      (choice == 'paper' && computer_choice == 'rock') ||
      (choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif (choice == 'rock' && computer_choice == 'paper') ||
        (choice == 'paper' && computer_choice == 'scissors') ||
        (choice == 'scissors' && computer_choice == 'rock')
    prompt("You lose!")
  else (choice == 'rock' && computer_choice == 'rock') ||
      (choice == 'paper' && computer_choice == 'paper') ||
      (choice == 'scissors' && computer_choice == 'scissors')
    prompt("It's a tie!")
  end

  prompt("Would you like to play again?")
  again? = Kernel.gets().chomp()
  break unless again?.downcase().start_with?('y')
end

prompt("Thank you for playing, good bye!")