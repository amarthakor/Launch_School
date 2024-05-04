=begin

Update this class so you can use it to determine the lowest ranking and 
highest ranking cards in an Array of Card objects:

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

For this exercise, numeric cards are low cards, ordered from 2 through 10. 
Jacks are higher than 10s, Queens are higher than Jacks, Kings are higher 
than Queens, and Aces are higher than Kings. The suit plays no part in the 
relative ranking of cards.

If you have two or more cards of the same rank in your list, your min and max 
methods should return one of the matching cards; it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create 
a #to_s method that returns a String representation of the card, e.g., 
"Jack of Diamonds", "4 of Clubs", etc.

=end

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end