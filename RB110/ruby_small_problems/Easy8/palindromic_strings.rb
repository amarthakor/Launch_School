=begin
Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged
in the same sequence as the substrings appear in the string. Duplicate 
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
"Abc-bA" are. In addition, assume that single characters are not palindromes.

--- P
- Given a string, return an array of all possible substrings that are palindromic
- and have more than 1 character. The return array should have substrings ordered
- in the same order that the character first appears in the string. Duplicates
- will be counted.

input: string
output: array of substrings

Ex:
  'madam' == ma, mad, mada, madam, ad, ada, adam, da, dam, am 
      - given string, for each char need to iterate (first loop)
        - then find every possible substring of length 2 or greater for each character (2nd loop)
      - substrings should be the same as reverse substring (#reverse?)
      - 'madam' == ['madam', 'ada'] select all substrings that are palindromic (#select?)


--- E
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']

--- D
- beginning: string
- intermediate: use string idx values to iterate over string
- ending: move substrings to array to satisfy problem requirements

--- A
- initialize empty array to store palindromic substrings
  - palindromic_words = []
- obtain all substrings of string
  - for each char (first loop)
     - iterate UPTO the last character, where we obtain all possible substrings  (second loop)
     - for each iteration, append the current char upto the end range of chars
        - increase the end range of chars by 1 each iteration
- select all substrings that are palindromic (#select? #reverse?)
  - array_of_substrings.select { |substring| substring == substring.reverse }
=end

def palindromes(str)
  palindromic_words = []
  last_char = str.size

  str.size.times do |current_idx|
    2.upto(last_char) do |range_of_chars|
    palindromic_words << str[current_idx, range_of_chars]
    end
    last_char -= 1
  end
  palindromic_words.select { |substring| substring == substring.reverse }

end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]