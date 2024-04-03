=begin
#Find the missing letter
Write a method that takes an array of consecutive (increasing) 
letters as input and that returns the missing letter in the
array.
You will always get an valid array. And it will be always 
exactly one letter be missing. The length of the array will always
be at least 2.

The array will always contain letters in only one case.

Example:
['a','b','c','d','f'] -> 'e' 
['O','Q','R','S'] -> 'P'
["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

Problem: Given an array of letters, return a string letter

Rules:
- Given array of chars is consecutive letters (increasing order)
- Input will always be valid, at least two elements in array
- Always exactly one missing letter
- Return the missing letter from the array
  - match case of given input

Algorithm:
- CREATE an array of lowercase chars and an array of uppercase chars
- DETERMINE the case of input
- SET index to the index of the first char in the correct array
- ITERATE over given input
  - for each char 
    - find the current index of the char within the correct alphabet
    - if index is equal to the index of the current char in the given array
      - increment index by 1
    - otherwise
      - return the character found at the index specified by 'index' from the correct array

=end

UPPER = ('A'..'Z').to_a
LOWER = ('a'..'z').to_a

def find_missing_ltr(array)
  array[0] == array[0].upcase ? alphabet = UPPER : alphabet = LOWER
  index = alphabet.index(array[0])

  array.each do |char|
    alphabet.index(char) == index ? index += 1 : (return alphabet[index])
  end
end


p find_missing_ltr(['a','b','c','d','f'])  == 'e'
p find_missing_ltr(['O','Q','R','S'])  == 'P'