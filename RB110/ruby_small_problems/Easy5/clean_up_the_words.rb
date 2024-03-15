=begin
Given a string that consists of some words (all lowercased) and an
assortment of non-alphabetic characters, write a method that returns that
string with all of the non-alphabetic characters replaced by spaces.
If one or more non-alphabetic characters occur in a row, you should only
have one space in the result (the result should never have consecutive spaces).


Examples:
cleanup("---what's my +*& line?") == ' what s my line '


--- P
- GIVEN: string
- RETURN: a modified string where;
        - given string will be all lowercased
        - string consists of mix of alphabetical + non alphabetical chars
        - replace all non-alphabetical chars with spaces
        - if there are multiple non-alphas in a row, only replace with one space
          for all non-alpha chars in a row (i.e. there shouldnt be consecutive spaces
          in a row)
          
- should we return original string or new string?
  - assume either works
- what should we do if string is empty?
    - return smpty string
--- E
- cleanup("---what's my +*& line?") == ' what s my line '
  - non-alpha chars are '--- ' +*& ?'
    - replace w/ spaces "   what s my    line "
    - reduce multiple spaces to one space ' what s my line '
--- D
begining: string
middle: array to iterate over each char and perform modifications based on specific criteria
 ending : modified string

--- A
- CREATE a range of only alpha chars
  - ('a'..'z')
- REPLACE all non-alpha chars with spaces
  - ITERATE through the string
    - for each char
      - if it is an alpha char
        - leave it alone
      - otherwise
        - transform it into a whitespace

- REMOVE any consecutive spaces
  - if the current char and the next char are both whitepsaces
    - delete the current index whitespace
- JOIN the array of chars bcak into a string
=end

def cleanup(str)
  new_str = str.chars.map {|char| ('a'..'z').include?(char) ? char : ' '}

  new_str.map.with_index do |char, idx|
    (new_str[idx + 1] == char && char == ' ') ? new_str.delete(idx) : char
  end.join
end

p cleanup("---what's my +*& line?") == ' what s my line '