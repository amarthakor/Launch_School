=begin

Modify the kebabize function so that it converts a camel case string into a kebab case.


kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps


Notes: the returned string should only contain lowercase letters

Problem: Given a string, return a modified string

Rules:
0) Given string will be in camel case
1) Return string should be in 'kebab case'

2) Return string should only include lowercase chars
  - Ignore all other chars

Algorithm:
- CREATE a comparison lowercase alphabetical string
- CREATE a results array
- INITIALIZE a current word variable
- CONVERT the given string into an array of chars
- TRANSFORM the array of chars
  - for each char
    - if the current char is nonalpha
      - skip
    - if the current char is uppercase
      - transform the current char to include a ' ' before the char
    - else the char is lowercase
      - return the char
  
=end
LOWERCASE_ALPHA = ('a'..'z').to_a
UPPERCASE_ALPHA = ('A'..'Z').to_a

def kebabize(string)
  word = ''
  results = []

  string.chars.map do |char|
    if !LOWERCASE_ALPHA.include?(char) && !UPPERCASE_ALPHA.include?(char)
      next
    elsif UPPERCASE_ALPHA.include?(char)
      char = [' ', char.downcase]
    else
      char
    end
  end.join.split.join('-')
end


p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'