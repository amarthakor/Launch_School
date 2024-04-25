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
  - Rock, paper, scissors is a turn based game where the user chooses an option
   from rock, paper,
    or scissors. Next the computer takes a turn picking one of the three
    options tated. Finally,
    the two choices are compared, and either a tie or winner/loser is declared.
        - Tie occurs if both choices are the same, otherwise
        - rock beats scissors
        - scissors beats paper
        - paper beats rock

2) Extract the major nouns and verbs from the description
  - Major nouns -> player, move, rule
    - Here we skipped Rock, Paper, Scissors as they are all 'sub-moves', they
    can be classed together
  - Major Verbs -> choose, compare

3) Organize and associate the verbs(actions) w/ the nouns(person, place, thing,
 or idea)

  - Player -> choose
  - Move
  - Rule

    - compare?

=end

class Move
  VALUES = ['rock', 'paper', 'scissors']

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

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
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
      break unless answer.empty?
      puts "Sorry, must enter a name."
    end
    self.name = answer
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'PS5', 'Xbox'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
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

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
