=begin
create a Deck class that contains all of the standard 52 playing cards. 
Use the following code to start your work:


class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

The Deck class should provide a #draw method to deal one card. 
The Deck should be shuffled when it is initialized and, if it runs out of 
cards, it should reset itself by generating a new set of 52 shuffled cards.

=end

class Deck
  attr_accessor :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    create_cards

  end

  def create_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        deck << Card.new(suit, rank)
      end
    end

    @deck.shuffle!
  end

  def draw
    create_cards if @deck.empty?
    deck.pop
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(type, value)
    @suit = type
    @rank = value
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.