=begin
Twenty-One is a card game consisting of a dealer and a player, 
where the participants try to get as close to 21 as possible without going over

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then t
  he highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.

Nouns
- Player
- Dealer
- Deck
- Hand?
- Card
- Game class to tie everything together

Verbs
- Hit
- Stay
- Total?
- Bust?

Organize associations

- Hand
  - total?
  - Bust?
- Player
  - Hit
  - Stay
  # Collobarates with hand?
- Dealer
  - Hit
  - Stay
  # Collaborates with hand?
- Card
  - total?
  # maybe collaborates with Hand?
- Deck
  - colloborates with hand

- Game
  - Common interface to tie in all other classes / behaviors?
# Implement Spike


class Hand
  # need to initialize some way to "hold" a players cards
  # porbably need array
end

class Player
  # need to create a way to store all cards that belong to player
  # Hand object would probably be ideal

  def hit

  end

  def stay

  end
end

class Dealer
  # need to create a way to store all cards that belong to player
  # Hand object would probably be ideal

  def hit # hit will depend on if dealer card sum is less than 17

  end

  def stay

  end
end

class Card
  # probably need to create all 52 type Card objects
  # for each suit, create all suit * card num combination
  # initialize state..
    # @rank
    # @suite
end

class Deck
  # will the Deck class simply be the overall 52 card sum?
  # in other words, should we just create a Deck object of 52 Card class objects?
  # array?
end

class Game
  def start
    # sequence of steps to run a game?
      1) Welcome message - explain rules
      2) Show Player hand + total
      loop
        3) Player Hit or Stay
        4) Dealers turn
        5) break if someone wins or someone busts
      end
      6) declare winner
      7) display closing msg
  end
end

=end

class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def total
    card_values = @cards.map {|card| card.rank}
    card_values.map {|card| special_card_values(card) }.sum
  end

  def special_card_values(card)
    if ['Jack', 'Queen', 'King'].include?(card)
      card = 10
    elsif ['Ace'].include?(card)
      card = 11
    else
      card
    end
  end


end

class Participant
  attr_reader :hand
  def initialize
    @hand = Hand.new
  end

  def hit
    # gets new card from deck

  end

  def stay
    # does nthing for this turn
  end

  def bust?
    # bust if hand sum is over 21... 
  end

  def show_cards
    @hand.cards.map { |card| "#{card.rank} of #{card.suite}" }.join(', ')
  end
end

class Player < Participant
end

class Dealer < Participant
  def hit
    super #if #hand sum is less than 17
    # if hand sum is less than 17, dealer hits
  end
end

class Card
  attr_accessor :rank, :suite

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUITES = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

  def initialize(value, symbol)
    @rank = value
    @suite = symbol
  end

end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITES.each do |suite|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suite)
      end
    end

    shuffle_deck!
  end

  def shuffle_deck!
    @cards.shuffle!
  end

  def deal
    cards.pop
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def display_welcome_message
    puts "Welcome to Twenty One!"
    display_rules
  end

  def display_rules
    puts "The rules are simple:
    - You start off with 2 cards
    - On each turn, you can hit or stay
    - Your goal is to get as close to 21 as possible, without going over
    - If you go over 21, you lose
    - If the dealer goes over 21, you win
    - If you both stay, the player with the highest total wins
    - If you both stay and the totals are the same, you tie
    - Good luck!"
  end

  def deal_card
    deck.deal
  end

  def deal_initial_cards
    2.times { |_| player.hand.cards << deal_card }
    2.times { |_| dealer.hand.cards << deal_card }
  end

  def show_initial_cards
    deal_initial_cards
    puts
    puts "Your hand: #{player.show_cards}"
    puts "Your total is: #{player.hand.total}"
    puts
    puts "Dealers hand: #{dealer.show_cards}"
    puts "Dealers total is: #{dealer.hand.total}"
  end

  def show_cards
    puts "Your hand: #{player.show_cards}"
    puts "Your total is: #{player.hand.total}"
  end

  #
  #
  #
  # Left off here!!! Need to create method to stop repeating '.hand.cards' so much
  # Need to create dealer turn next
  # Then show result after 1 full round
  # Then display end message
  # Then work on looping construct for multiple rounds and break conditions
  def players_turn
    puts
    puts "Would you like to hit or stay?"
    answer = gets.chomp.downcase
    player.hand.cards << deal_card if answer == 'y'
    puts "You drew #{player.hand.cards.last.rank} #{player.hand.cards.last.suite}"
    show_cards
  end

  def start
    display_welcome_message
    show_initial_cards
    players_turn
    # dealers_turn
    # show_result
    # delcare_winner
    # display_closing_msg
  end
end

game = TwentyOne.new
game.start # triggers game