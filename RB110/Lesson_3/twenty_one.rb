# twenty one high level code
#
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#     - repeat until bust or "stay"
# 4. If player busts, dealer wins.
# 5. Dealer turn: hit or stay
#     - repeat until total >= 17
# 6. If dealer busts, player wins
# 7. Compare cards and declare winner

SUITS = ['H', 'D', 'S', 'C']
CARD_NUMBERS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end
