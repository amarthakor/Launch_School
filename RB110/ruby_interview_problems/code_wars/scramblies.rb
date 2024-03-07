=begin
Complete the function scramble(str1, str2) that returns true if a portion of
str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.

Ex.
scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False

--- p
- GIVEN: two strings
- RETURN: return true if the first string can be rearranged to match str2
  - strings will only use lowercase letters
  - no punctuation/ digits
  - 
--- E
- scramble('rkqodlw', 'world')
  - string 1 contains w, o, r, l, d chars which can create str2 word 'world'

- scramble('katas', 'steak')
  - string 1 can form stak, but doesn't include an 'e' and therefore cannot match 
    string 2 which is 'steak'

--- D
- beign: 2 strings
- middle: array or string slice
- end: boolean; true or false

--- A
- TRANSOFRM all 
- CHECK if each character in string 2 is found in string 1
  -
  - if so, return TRUE
  - otehrwise, return FALSE

=end

def scramble(str1, str2)
  str2.chars.map { |char| str1.include?(char) }.all?
end

p scramble('rkqodlw', 'world') #== true
p scramble('cedewaraaossoqqyt', 'codewars') #== true
p scramble('katas', 'steak') #== false
p (scramble('scriptjava', 'javascript')) # == true
p (scramble('scriptingjava', 'javascript')) # == true