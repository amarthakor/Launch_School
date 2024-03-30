=begin
In this kata you are required to, given a string, replace every letter 
with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.
"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 
22 5 15 3 12 15 3 11" (as a string)

Problem: Given a string, return a string

Rules:
- Return string is going to be filled with integers that represent lowercase chars
  - integer representation is based on alphabetical position of char
  - i.e. a == 1.. z == 26
- Ignore anyything that isnt a letter
- If a character is not a letter, nothing should take its space

Algorithm:
- CREATE an array of lowercase alphabetical letters
- CREATE an array for integers only
- TRANSFORM my given string into a new string
  - CONVERT into array of lowercase chars
  - IF the current char is found in the array of chars
    - append the index value of the char in the alpha array to the itneger array

- JOIN the array of integers into a string


=end

ALPHA = ('a'..'z').to_a

def alphabet_position(string)
  character_num = []

  string.downcase.chars.each do |char|
    character_num << ALPHA.index(char) + 1 if ALPHA.include?(char)
  end

  character_num.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""