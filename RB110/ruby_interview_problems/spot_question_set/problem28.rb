=begin 
What is an anagram? Well, two words are anagrams of each other if they 
both contain the same letters. For example:
'abba' & 'baab' == true
'abba' & 'bbaa' == true
'abba' & 'abbba' == false
'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. 
You will be given two inputs a word and an array
with words. You should return an array of all the anagrams or an empty 
array if there are none. 

Problem: Given two arguments, a string and an array of strings, return an array

Rules:
- An anagram is when two words contain the same letters
- Given a word and array of possible anagrams
- Return an array of words that are anagrams
- Return empty array if no words are anagrams
- Count must match on both words
- Both words must have same exact letters
  - cannot have additional chars
- All words will be in lowercase

Algorithm:
- CREATE a results array
- ITERATE over the array of possible anagrams
  - CHECK to see the lengths of both the given word and the current word are the same
  - IF the above is true
    - ITERATE over the current word
      - check to see all chars in the current word match the given word
      - IF so
        - append the word into the results array
  - OTHERWISE, go to the next word
- RETURN the results array

=end

def anagrams(target, words)
  results = []
  
  words.each do |word|
    if word.length == target.length
      anagrams = word.chars.map { |char| word.count(char) == target.count(char) }.all?
    end
    results << word if anagrams
  end

  results
end


p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []