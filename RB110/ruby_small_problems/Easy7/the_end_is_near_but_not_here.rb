=begin
Write a method that returns the next to last word in the 
String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

----------------------
--- P
- Given: string
- RETURN: string
        - must be second to last word in given string

- words are separated by whitespace
- input string will always have at least 2 'words'

--- E
penultimate('Launch School is great!') == 'is'
- second to last 'word' in input string is 'is'
  - return 'is'
- input string index value ranges from 0-3
  - second to last word has index of 2
  - second to last element in any array has index of -2 

--- D
- beginning: string
- intermediate: use array to work over string object with index values
- ending: string


--- A
- CONVERT string into an array of elements, separated by whitespace
- RETURN the element at index value -2
=end

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'