=begin
Create a method that takes a string as an argument and returns true if 
the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at 
least once. For example, the sentence "Five quacking zephyrs jolt my 
wax bed." is a pangram since it uses every letter at least once. 
Note that case is irrelevant.

Examples:
p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

Problem: Given a string, return boolean true if string is a panagram, otherwise false

Input: string
Output: true or false

Rules:
- Pangram is defined as sentences that contain every letter of the alphabet at
  least once
- Case does not matter

Algorithm:
- CREATE an an array of the lowercaselaphbet
- LOWERCASE the given string
- ITERATE over the alphabet by transofrming it
  - for each character
  - check if the character is included in the given string
    - if so, return true
    - otherwise return false
- CHECK if all the transformed values are true
=end

def is_pangram(string)
  alphabet = ('a'..'z').to_a

  alphabet.map { |letter| string.downcase.include?(letter) }.all?
end


p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true