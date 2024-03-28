=begin
Write a function that takes in a string of one or more words, and returns the 
same string, but with all five or more letter words reversed 

(Just like the name of this Kata).

Strings passed in will consist of only letters and spaces. 
Spaces will be included only when more than one word is present.


Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

Problem: Given a string, return a modified string

Rules:
- Can be new string or same string?
- Return string will have all words longer than 5 chars reversed
- Given string will only consist of alpha chars and spaces

Algorithm:
- CONVERT the string into an array of words
- TRANSFORM the array of words
  - if the current word size is > 4
    - reverse it
  - otherwise leave it unchanged
- JOIN the array of words into a string

=end

def spinWords(string)
  string.split.map { |word| word.size > 4 ? word.reverse : word }.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'