# Write a program that takes a word and a list of possible anagrams and 
# selects the correct sublist that contains the anagrams of the word.
# 3:10pm
# For example, given the word "listen" and a list of candidates like 
# "enlists", "google", "inlets", and "banana", the program should return
#  a list containing "inlets". Please read the test suite for the exact
# rules of anagrams.

=begin
--- P
Problem: Given a word and an array of strings, return an array with anagrams of the given word

Rules:
- An anagram is a word spelled with the same letters but different roder
- Case does not matter
- Duplicate letters do not form an anagram
  - Count of each char from given word must match anagram
  - size of given word must match each anagram
- Anagram cannot be the same as given word
- If no anagrams present, return an empty array

---- E
-> Given ('galea'), return []
-> ['eagle'] 2 e's, 1 a, 1g, 1l, 1

--- D
array for comparison, inclusion, and new return array

--- A
- Constructor method contains 1 argument
  - the anagram base 

- One isntance method, #match, which takes one argument, an array of strings
  - this method returns an array of all anagrams
  - CREATE an empty array of anagrams
  - ITERATE through argument array of possible_anagrams
    - for each anagram_word
      - ITERATE over all chars of the anagram
        - TRANSFORM char into boolean if the count of the current char is the same in the anagram
    - if the transformed array of chars are all true
      - append to array of possible_ans
    - else do not append the word
  - REMOVE any words in the array if they match the given word
=end

class Anagram
  def initialize(word)
    @anagram = word.downcase
  end

  def match(list_of_words)
    possible_anagrams = []

    possible_anagrams = list_of_words.select do |word|
      word.chars.map do |char|
        (@anagram.count(char) == word.downcase.count(char))
      end.all?
    end

    possible_anagrams.select do |word|
      @anagram.size == word.size && @anagram.downcase != word.downcase
    end
  end
end


