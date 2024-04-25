=begin

Build a Rock Paper Scissors game except this time w/ OOP

General flow of game
  - user makes a choice
  - computer makes a choice
  - winner is displayed

Approach to OOP

1) Write a textual description of the problem or exercise
2) Extract the major nouns and verbs from the description
3) Organize and associate the verbs(actions) w/ the nouns(person, place, thing,
 or idea)
4) The nouns form the classes, the verbs form methods (behaviors)

- Main focus is to modularize and organize the code into a structured format ->
 classes
- After initial class definitions are formed, the final step is to orchestrate
 flow of program
  using objects instantiated from the classes we created

1) Write a textual description of the problem or exercise
  - Rock, paper, scissors, lizard, spock is a turn based game where the user
    chooses an option
   from rock, paper, scissors, lizard or spock
  - Next the computer takes a turn picking one of the five choices
    Finally,
    the two choices are compared
        - Tie occurs if both choices are the same, 0 points awarded otherwise
        - rock beats scissors and lizard
        - scissors beats paper and lizard
        - paper beats rock and spock
        - spock beats scissors and rock
        - lizard beats paper and spock
        - winner is awarded +1 point
        - first user to 10 points is the winner

2) Extract the major nouns and verbs from the description
  - Major nouns -> player, move, rule, score
    - Here we skipped Rock, Paper, Scissors as they are all 'sub-moves', they
    can be classed together
  - Major Verbs -> choose, compare, moves

3) Organize and associate the verbs(actions) w/ the nouns(person, place, thing,
 or idea)

  - Player -> choose
  - Move -> moves
  - Rule

=end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def rock_wins(user)
    (rock? && user.scissors?) || (rock? && user.lizard?)
  end

  def paper_wins(user)
    (paper? && user.spock?) || (paper? && user.rock?)
  end

  def scissors_wins(user)
    (scissors? && user.paper?) || (scissors? && user.lizard?)
  end

  def lizard_wins(user)
    (lizard? && user.paper?) || (lizard? && user.spock?)
  end

  def spock_wins(user)
    (spock? && user.scissors?) || (spock? && user.rock?)
  end

  def rock_loses(user)
    (rock? && user.paper?) || (rock? && user.spock?)
  end

  def paper_loses(user)
    (paper? && user.scissors?) || (paper? && user.lizard?)
  end

  def scissors_loses(user)
    (scissors? && user.rock?) || (scissors? && user.spock?)
  end

  def lizard_loses(user)
    (lizard? && user.rock?) || (lizard? && user.scissors)
  end

  def spock_loses(user)
    (spock? && user.lizard?) || (spock? && user.paper?)
  end

  def >(other_move)
    rock_wins(other_move) ||
      paper_wins(other_move) ||
      scissors_wins(other_move) ||
      lizard_wins(other_move) ||
      spock_wins(other_move)
  end

  def <(other_move)
    rock_loses(other_move) ||
      paper_loses(other_move) ||
      scissors_loses(other_move) ||
      lizard_loses(other_move) ||
      spock_loses(other_move)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    answer = ''
    loop do
      puts "What's your name?"
      answer = gets.chomp
      break unless answer.empty? || answer.include?(' ')
      puts "Sorry, must enter a name with no spaces"
    end
    self.name = answer.capitalize
  end

  def choose
    choice = nil
    loop do
      puts
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['Gandalf', 'Masterchief', 'Zues', 'Osceola'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :human_score, :comp_score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_score = 0
    @comp_score = 0
    @human_moves = ''
    @comp_moves = ''
  end

  def display_opening_msg
    display_welcome_message
    display_rules
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard! "
    puts
  end

  def display_rules
    puts "The game is simple, your objective is to beat the opponent
    Each round you win, you gain 1 point, while losses give you none.
    First to 10 points wins the game!"
    puts
    puts "Rock beats Scissors and Lizard
    Paper beats Rock and Spock
    Scissors beats Paper and Lizard
    Spock beats Scissors and Rock
    Lizard beats Paper and Spock"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard! Good bye!"
  end

  def display_moves
    puts
    puts "#{human.name} chose #{human.move}"
    @human_moves << "#{human.move}, "
    puts "#{computer.name} chose #{computer.move}"
    @comp_moves << "#{computer.move}, "
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won this round!"
      self.human_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won this round!"
      self.comp_score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts
    puts "#{human.name}'s score: #{human_score}"
    puts "#{computer.name}'s score: #{comp_score}"
    puts
  end

  def display_past_moves
    puts "#{human.name}'s past moves: #{@human_moves}"
    puts
    puts "#{computer.name}'s past moves: #{@comp_moves}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must enter y or n."
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def display_overall_winner
    puts "Congrats on winning, #{human.name}!" if human_score == 10
    puts "#{computer.name} won, better luck next time!" if comp_score == 10
  end

  def play
    display_opening_msg
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      break if human_score == 10 || comp_score == 10
      display_past_moves
    end
    display_overall_winner
    display_goodbye_message
  end
end

RPSGame.new.play
