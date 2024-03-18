=begin
In the easy exercises, we worked on a problem where we had to count the number 
of uppercase and lowercase characters, as well as characters that were neither 
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 
entries: one represents the percentage of characters in the string that are 
lowercase letters, one the percentage of characters that are uppercase letters, 
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples:

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

--- P
- given: string of chars
- return: a hash w/ 3 KV pairs
          - the first KV pairs represents the % of lowercase chars in the string
          - the second KV pair represents the % of upperchase chars in the string
          - the third KV pair represents the % of chars that are not alphabetical

- values will be represented as floats
- keys will be symbols
- assume string will always have at least 1 char
- are spaces counted as 'neither'?
  - spaces do count as 'neither'
--- E
- '123' 
  - three nonalpha chars and 0 alpha chars
    - 3/3 chars are neither
    -> expect lowercase == 0, uppercase == 0, neither == 100.0

- 'abCdef 123'  -> 5/10 lowercase chars, 1/10 uppercase chars, 4/10 neither
  - 'abdef' lowcase, 'C' upcase, ' 123' upcase chars
  -> lowercase: 50.0, uppercase: 10.0, neither 40.0

--- D
beginning: string
intermediate: hash for return result, may use array to iterate over each character
ending: hash

--- A
- CREATE a results hash and set each value to 0.0
- FIND the total number of chars in a string
- COUNT the number of chars that are lowercase alpha 
  - divide that number by total/chars and set thatvalue for lowercase KV pair
- COUNT the number of chars that are uppercase alpha
    - divide that number by total chars and set that value for uppercase KV pair
- SUM lowercase+uppercase
- FIND the difference between the previous sum
- DIVIDE the difference from total chars ands et value to neither KV pair

=end
# 9:55

LOWER_ALPHA = ('a'..'z').to_a.join
UPPER_ALPHA = ('A'..'Z').to_a.join

def letter_percentages(string)
  results = { lowercase: 0.0, uppercase: 0.0, neither: 0.0}
  total_chars = string.length.to_f
  upper_chars, lower_chars, niether_chars = 0, 0, 0

  string.chars.each do |char|
    lower_chars += 1 if LOWER_ALPHA.include?(char)
    upper_chars += 1 if UPPER_ALPHA.include?(char)
  end
  neither_chars = total_chars - (upper_chars + lower_chars)

  results[:lowercase] = (lower_chars / total_chars) * 100
  results[:uppercase] = (upper_chars / total_chars) * 100
  results[:neither] = (neither_chars / total_chars) * 100
  results 
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }