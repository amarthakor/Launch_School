=begin
Given a string of words separated by spaces, write a method that takes
this string of words and returns a string in which the first and last
letters of every word are swapped.

You may assume that every word contains at least one letter, and that
the string will always contain at least one word. You may also assume
that each string contains nothing but words and spaces.



--- P
Given a string of words, return a new string of words in which the FIRST
and LAST characctes of every word switch places
INPUT: STRING
OUTPUT: STRING

--- E
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
'Oh => ho, wonderful => londerfuw'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'


--- D
- can use array to identify first and last chars of each word


--- A
CREATE an array that consists of words from the string
  - string.chars
TRANSFORM the element where we flip flop the first and last chars w/ each other
  - find the last index by getting the string size and subtracting it by 1
    - last_ char = string.size - 1
  - save the first character in a var
    - first_char = string[0]
  - reassign the 0th index, first char, to the saved value of the last char
    - string[0] = string[last_char]
  - reassign the last char to the saved value of the first char
    - string[last_char] = string[first_char]
TRANSFORM this new array into a string
  - can use the join method
RETURN this new string

=end

def swap(string)
  string = string.split(' ')

  string.map do |word|
    last_char = word.size - 1
    first_char = word[0]

    word[0] = word[last_char]
    word[last_char] = first_char
  end
  string.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'