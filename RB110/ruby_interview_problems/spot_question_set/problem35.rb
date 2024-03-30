=begin
In this simple Kata your task is to create a function that turns a 
string into a Mexican Wave. You will be passed a string
and you must return that string in an array where an uppercase 
letter is a person standing up.

Rules
1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as 
if it was an empty seat.

Problem: Given a string, return an array

Rules:
- INPUT string will always be lowercase
  - may be empty string
- Return array will have multiple strings where each word
  - has a single letter capitalized
- Start from first alpha character and work towards last alpha char
- Skip whitespace, punctaiton, etc.

Algorithm:
- CONVERT the string into an array of chars
- ITERATE over the array of chars
      - for each char
        - transform it into the original word
- ITERATE over the array of repeat words
  - for each word and index
    - upcase the current index but leave all other chars lowercased
    - append this value to a new array
    - reassign the word to itself but downcased
- RETURN the array with each index upcased
=end

def wave(string)
  results = []
  string.chars.each_with_index do |char, idx|
    next if char == ' '
    string[idx] = char.upcase
    results << string
    string = string.downcase
  end
  results
end


p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
"codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
"two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]