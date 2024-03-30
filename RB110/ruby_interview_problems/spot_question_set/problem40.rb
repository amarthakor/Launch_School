=begin
The goal of this exercise is to convert a string to a new string where 
each character in the new string is "(" if that
character appears only once in the original string, or ")" if that character
appears more than once in the original string.
Ignore capitalization when determining if a character is a duplicate.

Examples
"din" => "((("
"recede" => "()()()"
"Success" => ")())())"
"(( @" => "))(("

Problem: Given a string, return a new string

Rules:
- Return stirng is a series of '(' or ')'
- If a charactor appears only once in the given string
  - Transofrm it to '('
- If a character appears more than once in the originl string
  - Transofrm it to ')'

- Case is irrelevant 


Algorithm:
- DOWNCASE the entire string
- TRANSOFRM an array of lowercase chars
  - for each char
  - If the count of the char is equal to 1
    - transofrm to '('
  - If the count of the char is greater than 1
    - transform to ')'
- JOIN the array of transofrmed chars
=end

def duplicate_encode(string)
  string = string.downcase
  string.chars.map { |char| string.count(char) == 1 ? '(' : ')' }.join
end


p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("