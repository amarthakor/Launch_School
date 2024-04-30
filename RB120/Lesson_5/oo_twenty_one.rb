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

  def initialize
    @cards = []
  end
  # need to initialize some way to "hold" a players cards
  # porbably need array
  
  def total
    # need to find way to define total value of cards
    @cards.sum # for now
  end
end

class Player

  def initialize
    @hand = Hand.new
  end

  def hit

  end

  def stay

  end
end

class Dealer

  def initialize
    @hand = Hand.new
  end

  def hit
    # if hand sum is less than 17, dealer hits

  end

  def stay
    # if hand sum is 17, dealer stays
    @hand.total >= 17
  end
end

class Card
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITES = ['Heart', 'Diamond', 'Spades', 'Clubs']

  def initialize
    @rank
    @suite
  end

  # probably need to create all 52 type Card objects
  # for each suit, create all suit * card num combination
  # initialize state..
    # @rank
    # @suite
end

class Deck
  
  def initialize
    @cards = []

    # iterate and append in 52 cards to deck in here
  end


  # will the Deck class simply be the overall 52 card sum?
  # in other words, should we just create a Deck object of 52 Card class objects?
  # array?
end


card = Card.new
card.create_deck
p card
# Game.new.start # triggers game