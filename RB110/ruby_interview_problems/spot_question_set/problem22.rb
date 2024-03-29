=begin
Complete the function scramble(str1, str2) that returns true if a 
portion of str1 characters can be rearranged to match
str2, otherwise returns false.

Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered
Input strings s1 and s2 are null terminated.

Problem: Given 2 string arugments, return true or false

Rules:
- Return true if the chars in str1 can create str2
  - Otherwise return false

- String args will be lowercased alphabetical chars

Algorithm:
- ITERATE over array of chars of str2
  - For each char
    - check if the current char is included in str 1
    - if so, return true, otehrwise return false
- CHECK if all values in the array are true

=end

def scramble(str1, str2)
  # str2.chars.map {|char| str2.count(char) <= str1.count(char) }.all?
  str2.chars.map {|char| str1.include?(char) }.all?
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('rkqodlw','world') == true
p scramble('cedewaraaossoqqyt','codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true