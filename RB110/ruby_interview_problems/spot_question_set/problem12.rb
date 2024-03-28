=begin
A pangram is a sentence that contains every single letter of the alphabet 
at least once. For example, the sentence "The quick brown fox jumps over 
the lazy dog" is a pangram, because it uses the letters A-Z at least once 
(case is irrelevant).

- Given a string, detect whether or not it is a pangram. 
- Return True if it is, False if not. 
- Ignore numbers and punctuation.

Problem: Given a string, return a boolean

Rules:
- Return true if string is a panagram
- Return false if string is not a panagram

- A panagram is a sentence that uses every single letter of the alphabet 1x+
- Case doesnt matter
- Ignore all other chars that aren't alphabetical

- Algorithm:
- CREATE a reference array of the lowercase alphabet
- TRANSFORM over the lowercase alphabet array
  - For each char
    - check if the given string includes the current char
      - if so, true
      - toherwise false
- Check the transformed array if all values are true

=end

def panagram?(string)
  ('a'..'z').to_a.map { |char| string.downcase.include?(char) }.all?
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false