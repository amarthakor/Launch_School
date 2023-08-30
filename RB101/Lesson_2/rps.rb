VALID_CHOICES = ['r', 'p', 'sc', 'sp', 'l']                 
WINNING_COMBOS = {'r' => ['sc', 'l'], 'p' => ['r', 'sp'],
                  'sc' => ['p', 'l'], 'l' => ['p', 'sp'], 
                  'sp' => ['r', 'sc']}

def prompt_(message)
  Kernel.puts("=> #{message}")
end

def opening_prompt_
  prompt_("Welcome to rock, paper, scissors, lizard, spock!
   In this game we will be competing against each other")
end

def rules_explanation_
  prompt_("The rules are simple. First to win 3 rounds will be the grand winner
   Along side rock, paper, and scissors, we will also have two additional
   options: lizard and spock, where
   - Rock beats scissors and lizard,
   - Paper beats rock and spock,
   - Scissors beats paper and lizard,
   - Lizard beats paper and spock,
   - Spock beats rock and scissors")
end

def choice_
  prompt_("Enter 'r' for rock, 'p' for paper, 'sc' for scissors, 
   'l' for lizard, and 'sp' for spock")
end

def outcome(player, computer)
  if WINNING_COMBOS[player].include?(computer)
    prompt_("You won!")
    return "You won!"
  elsif WINNING_COMBOS[computer].include?(player)
    prompt_ "Computer won!"
    return "Computer won!"
  else
    prompt_("It's a tie!")
  end
end


def grand_winner(player, computer)
  if player == 3
    prompt_("Congratulations, you have defeated me!!")
  else computer == 3
    prompt_("Oh no! You have been defeated! Better luck next time")
  end
end

opening_prompt_
rules_explanation_

loop do
  computerS = 0
  playerS = 0
  loop do
    user = ''
    choice_
    loop do
      user = gets.chomp.downcase
      if VALID_CHOICES.include?(user)
        break
      else
        prompt_("Please enter a valid choice")
      end
    end

    computer_choice = VALID_CHOICES.sample
    prompt_("You chose #{user}, computer chose #{computer_choice}")

    score_counter = outcome(user, computer_choice)
    if score_counter == "Computer won!"
      computerS += 1
    elsif score_counter == "You won!"
      playerS += 1
    end
    prompt_("Your score: #{playerS}, computer score: #{computerS}")

    break if computerS == 3 || playerS == 3

  end

  grand_winner(playerS, computerS)

  prompt_("Would you like to play again?")
  again = Kernel.gets().chomp()
  break unless again.downcase().start_with?('y')
end

prompt_("Thank you for playing, good bye!")
