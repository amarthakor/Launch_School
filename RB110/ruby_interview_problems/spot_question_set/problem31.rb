=begin
An anagram is the result of rearranging the letters of a word to 
produce a new word (see wikipedia).

Note: anagrams are case insensitive
Complete the function to return true if the two arguments given 
are anagrams of each other; return false otherwise.


Examples
"foefet" is an anagram of "toffee"
"Buckethead" is an anagram of "DeathCubeK"

Problem: Given two strings, return a boolean

Rules:
- An anagram is when two words have the same letters in different orders
- Return true of the stringd are anagrams, false otherwise
- CASE is doesn't matter
- Return false if not all chars are used to spell each other
- Count of matching chars must be the same
- IF the count doesn't match, return false

Algorithm:
- RETURN false if str1 size does not match str2 wize
- CONVERT the first strig into an array of chars
- ITERATE over the first string
  - for each char
    - if the current char is included in str2 and the counts are the same in both str
      - return true
    - else
      - return false
- CHECK if the array contains all trues
=end

def is_anagram(str1, str2)
  return false unless str1.size == str2.size

  str1, str2 = str1.downcase, str2.downcase

  str1.chars.map do |char|
    if (str2.include?(char) && (str2.count(char) == str1.count(char)))
      true
    elsif !str2.include?(char)
      false
    end
  end.all?
end



p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false