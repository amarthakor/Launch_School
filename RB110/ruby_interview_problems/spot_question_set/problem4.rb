=begin
Alphabet symmetry
Consider the word "abode". We can see that the letter a is in position 1 and b is 
in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also
that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. 

For example:
solve(["abode","ABc","xyzD"]) = [4, 3, 1]

See test cases for more examples.
Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Problem: Given an array of words, return an array of integers

Rules:
- Given an array where elements are 'words'
- Return an array of integers where the integer represents the count of characters
  - that are in the correct alphabetical position
- If a word starts with 'a', then the count would be 1, as 'a' is the first letter of the
  alphabet and also the first letter in this example word
  - Thios rule applys for every letter in the alphabet
- Input will consist of both upper + lowercase words

Algorithm:
- CREATE a string or array of chars of the lowercase alphabet
- INITIALIZE a counter variable to represent how many letters are in the correct spot
- ITERATE over the array of words (downcase all)
  - FOR each word
    - ITERATE over each character
      - for each char, if the index of the char is the same as the index of 
        - the comparison alphabet string
      - increment countervar by +=1
  - return the count for each word (transformation)

=end

def solve(words)
  alphabet = ('a'..'z').to_a

  words.map do |word|
    correct_spot_count = 0
    word.chars.map.with_index do |char, idx|
      word[idx].downcase == alphabet[idx] ? correct_spot_count += 1 : 0
    end.max
  end

end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]