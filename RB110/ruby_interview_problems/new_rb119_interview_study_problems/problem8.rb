=begin
Create a method that takes a non-empty string as an argument. The string 
consists entirely of lowercase alphabetic characters. The method should 
return the length of the longest vowel substring. The vowels of interest 
are "a", "e", "i", "o", and "u".

Examples:
p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5


Problem:
- Given a non empty string of all lowercase alpha chars, return the length of the longest
  vowel substring

  Input: String
Output: Integer count

  Rules:
- Vowels consist of 'aeiou'

Examples:
'launchschoolstudents' -> 2
- 'au', 'oo', 'u', 'e' -> max length is 2

'eau' -> 3
- 'e', 'a', 'u', 'ea', 'au', 'eau' -> max length is 3


Algorithm:
- RETURN 0 if the string does not include any vowels
- REPLACE all non vowel chars w/ space
- CREATE an array of just vowels separated by whitespace
- FIND the max size of each vowel 'word'
=end

VOWELS = %w(a e i o u)

def longest_vowel_substring(string)
  return 0 if string.chars.map { |char| VOWELS.include?(char) }.all?(false)

  string = string.gsub(/[bcdfghjklmnpqrstvwxyz]/, ' ').split

  string.map { |vowels| vowels.length }.max
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5