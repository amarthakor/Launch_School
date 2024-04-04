# Implement the function/method, minimum shorten. The function shortens a 
# sentence such that it will fit within the character limit set. It shortens 
# by removing vowels in the sequence of a, e, i, o, and u. Start removing from 
# the end of the sentence. If it can not be shortened to fit within character limit,
# return an empty string. Spaces don’t count for the limit.
=begin

Problem: Given a string and an integer arg, return a string

Rules:
- New string or mutate string?
- Return string size has to be under or at least the integer given
- Shorten by removing vowels a, e i , o u
  - Start eliminating all a's, then 'e', then i's, etc...
  - STart removing vowels from the end of the sentence
- Return an empty string if the string size cannot fit in at least integer characters
- Spaces dont count as characters
- only remove vowels tha are lowercased?

Examples:
- "this is a test sentence", 18 char limit -> 19chars
  - remove all A's starting from end -> 'this is test sentence' -> 18 chars

- "Hello World", 8char limit -> 10 chars
  - remove all e's first -> 'Hllo World' -> 9 chars
  - remove all o's next -> 'Hllo Wrld' -> 8char limit thus dont remove all o's
      - probably need to iterate thru words and then each word thru chars to not delete all vowels

Algorithm:
- RETURN empty string if string size with all vowels removed is over the integer arg
- SET a variable to reference the index value of the last character

- CREATE an array of chars from the string in reverse order
- ITERATE over array of chars
  - if the size of the array is <= char limit
    - next
  - else the size of the array is > than the char limit
    - delete the current char if its an 'a'
  - decremeent last_char variable to track index positions accordingly
- ITERATE over chars
  - repeat above process except for 'e'
- ITERATE over chars
  - repeat above process except for 'i'
- ITERATE over chars
  - repeat above process except for 'o'
- ITERATE over chars
  - repeat above process except for 'u'
- RETURN mutated string
  
=end

# last_char = string.size - 1
#   letters.each do |char|
#     next if (string.delete(' ')).size <= char_limit
#     if char == 'e'
#       string = string.chars
#       string.delete_at(last_char)
#       string = string.join
#     end
#     last_char -=1
#   end

def delete_vowel(string, vowel, limit)
  last_char = string.size - 1
  letters = string.chars.reverse

  letters.each do |char|
    next if (string.delete(' ')).size <= limit
    if char == vowel
      string = string.chars
      string.delete_at(last_char)
      string = string.join
    end
    last_char -=1
  end

 string
end

def minimum_shorten(string, char_limit)
  return '' if (string.chars - ['a', 'e', 'i', 'o', 'u']).size > char_limit
  letters = string.chars.reverse

  string = delete_vowel(string, 'a', char_limit)

  string = delete_vowel(string, 'e', char_limit)

  string = delete_vowel(string, 'i', char_limit)

  string = delete_vowel(string, 'o', char_limit)

  string = delete_vowel(string, 'u', char_limit)

end

p minimum_shorten('eeea', 3) == 'eee'
p minimum_shorten("This is a test sentence", 18) == 'This is  test sentence'
p minimum_shorten("Hello World", 8) == 'Hllo Wrld'
p minimum_shorten("Short", 10) == 'Short'
p minimum_shorten("A very long sentence with many vowels", 10) == ""