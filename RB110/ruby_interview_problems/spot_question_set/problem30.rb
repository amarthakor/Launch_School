=begin
Given two words, how many letters do you have to remove from 
them to make them anagrams?

Example
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10

Hints
A word is an anagram of another word if they have the same letters (usually in a different order).
Do not worry about case. All inputs will be lowercase.

Problem: Given a 2 string args, return an integer

Rules:
- All inputs will be lowercase
- REturn an integer that represents how many letters have to be removed
  from each word such that they contain the same letters in any order
- Count of letters must be the same, extras should be removed

Example:
- codewars, hackerrank -> 10
  - o, d, w, s -> 4
  - h, k, n, k, r, a, -> 6
  - 4 + 6 -> 10


Algorithm:
- CREATE a removed letters array
- FIND the size of both strings
- ITERATE over an array of chars for the first string
  - for each char
    - check if the current char is included in the 2nd string
      - if it is
        - check the count of the char in the full string compared to the 2nd string
        - if there is a difference, find the difference and append that value to removed chars
      - otherwise, find the count of chars in the full string w/ the current char
        - and append that value to the removed letters array
- REPEAT above process for 2nd string

- SUM the removed letters array
- RETURN this sum
=end

def anagram_difference(str1, str2)
  removed_letters = []
  
  str1.chars.uniq.each do |char|
    if str2.include?(char)
      difference = str1.count(char) - str2.count(char)
      removed_letters << difference.abs
    else
      removed_letters << str1.count(char)
    end
  end
  
  str2.chars.uniq.each do |char|
    removed_letters << str2.count(char) if !str1.include?(char)
  end

  removed_letters.sum
end


p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10