=begin
Write a method that takes a string, and returns a new string in which every 
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, 
and whitespace should not be doubled.

EXAMPLES:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

--- P
- GIVEN: string
- RETURN: new string where
          - any consonant is doubled
          - ignore all other char values
- if string is empty, return empty string
- keep case the same
--- E
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"

--- D
beginning: string
intermediate: array to modify each char in string
end: string

--- A
- CONVERT string to array of chars
- TRANSFORM array of chars where
  - if char is consonant, double it
  - else leave it alone
- CONVERT arrat back into string

=end
CONSONANT = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(str)
  str.chars.map do|char| 
    if CONSONANT.include?(char.downcase)
      char * 2
    else
      char
    end
  end.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""