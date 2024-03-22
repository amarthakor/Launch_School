=begin
Create a method that takes a string argument and returns the 
character that occurs most often in the string. If there are 
multiple characters with the same greatest frequency, return 
the one that appears first in the string. When counting characters,
consider uppercase and lowercase versions to be the same.

EXAMPLES:
p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

Problem:
- Given a string argument, return the character that occurs most often
  in the string.

Rules:
- if multiple chars have the same frequency, return the one that appears
  first in the string
- uppercase and lowercase chars all count the same ('A' == 'a')
- return char will always be lowercased

Examples:
'Happy Birthday' -> 'h'
  - 'H', 'h'
  - 'a', 'a',
  - 'p', 'p'
  - 'y', 'y'
-> 'H' appears first, so return 'h'
    - notice 'H' and 'h' both count, so they add up to 2

Algorithm:
- LOWERCASE all letters
- CREATE a hash to reference the letter(key) with the highest count as the value
- CREATE an array of all unique letters
- CONVERT the string of chars into an array of chars
- ITERATE through the array of unique chars
  - for each uniq char,
    - create a KV pair where the uniq hcar is the key and the count in the original string
      is the value
- FIND the max_count value from all KV pairs
- SELECT the KV pair w/ the max_count
=end

def most_common_char(string)
  string.downcase!
  highest_count = {}
  uniq_chars = string.chars.uniq

  uniq_chars.each do |letter|
    highest_count[letter] = string.count(letter)
  end
  max_count = highest_count.values.max

  highest_count.select do |key, value|
    return key if value == max_count
  end
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'
