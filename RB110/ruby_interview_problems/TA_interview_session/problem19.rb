=begin
9:58pm - 10:12pm

# Given a sentence, find all pairs of words whose first letter matches
 the last letter of its pair. Return an empty array if there’s no such
pair. Only consider words that have at least length of 2 for the pairings.


Problem: Given a string, reutrn an array of subarrays containing words from the given string

Rules:
- Given a string of words
- Return subarrays with two words where
  - if the first letter matches the last letter of its pair
    - select this pair as an subarray
- Conditions:
  - all words considered must have at least length of 2 or more for pairings

- does case matter when comparing first char and last char of a pair?
  - CASE does not matter
  - but case DOES matter for return subarray

Examples:
- "The cat in the hat"
  - "The cat" -> ['The', 'cat']
  - "The in" X
  - "The the" X
  - "The hat" -> ['The', 'hat']
  - "Cat in" X
  - "Cat the" X
  - "Cat hat" X
  - "In the" X
  - 'in hat' X
  - 'the hat' -> ['the', 'hat']
  - select all pairs that first char in first word match last char in second word

Algorithm:
- REMOVE all words that are less than 2 chars long
  - create an array of words and subtract all words that are 1 char long
- CREATE an empty pairs array
- FIND all subpairs of 2 words
  - ITERATE over each word
    - for each word
      - ITERATE from current word to last word
        - append the outter current word and the inner current word to pairs array
- SELECT all subpairs that meet condition as stated above
  - SELECt if word[0][0].downcase == word[1][-1].downcase

=end

def find_matching_pairs(string)
  words = string.split - string.split.select {|word| word.size < 2 }
  pairs = []

  words.size.times do |first_word|
    (first_word + 1).upto(words.size - 1) do |second_word|
      pairs << [words[first_word], words[second_word]]
    end
  end
  
  pairs.select { |pair| pair[0][0].downcase == pair[1][-1].downcase }
end


# Test cases
p find_matching_pairs("The cat in the hat") == [["The", "cat"], ["The", "hat"], ["the", "hat"]]
p find_matching_pairs("A man a plan a canal Panama") == []
p find_matching_pairs("This sentence has no pairs") == [["sentence", "has"], ["sentence", "pairs"]]
p find_matching_pairs("Apple leads to leap") == []