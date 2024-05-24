# Write a program that, given a word, computes the Scrabble score 
# for that word.
# 4:02pm
# Letter Values

# You'll need the following tile scores:

# Letter	Value
# A, E, I, O, U, L, N, R, S, T	1
# D, G	2
# B, C, M, P	3
# F, H, V, W, Y	4
# K	5
# J, X	8
# Q, Z	10

# How to Score

# Sum the values of all the tiles used in each word.
# For instance, lets consider the word CABBAGE which has the
# following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E
# Thus, to compute the final total (14 points), we count:


# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

=begin
--- P
Problem: Given a word, return an integer representing the score for the word

Rules:
- Letters A, E, I, O, U, L, N, R, S, T are worth 1 point
- Letters D, G are worth 2 points
- Letters B, C, M, P are worth 3 points
- Letters F, H, V, W, Y are worth 4 points
- Letters K is worth 5 points
- Letters J, X are worth 8 points
- LEtters Q, Z are worth 10 points

- Duplicate letters count to overall score
- nil scores 0
- Whitespace should not be counted
- CASE does not matter

--- E

--- D
Use hash to create array of letters as keys and points as value

--- A
- CREATE Constructor method with 1 argument
  - argument is the scrabble word we're scoring

- CREATE one instance method takes an optional argument #score()
  - Set points to 0
  - ITERATE over all chars in scrabble word
    - for each character
    - ITERATE over all keys (arrays of letters)
      - if the current key(letters) includes the current char upcased
        - inrement points by the value of the current key
  - RETURN points
=end

class Scrabble
  attr_reader :word
  LETTER_POINTS = {%w(A E I O U L N R S T) => 1, %w(D G) => 2, %w(B C M P) => 3,
                   %w(F H V W Y) => 4, %w(K) => 5, %w(J X) => 8, %w(Q Z) => 10}

  def initialize(scrabble_word)
    @word = scrabble_word.upcase if scrabble_word != nil
  end

  def score
    return 0 if word == nil
    points = 0

    word.chars.each do |char|
      LETTER_POINTS.each do |letters, point|
        points += point if letters.include?(char.upcase)
      end
    end

    points
  end

  def self.score(scrabble_word)
    Scrabble.new(scrabble_word).score
  end
end