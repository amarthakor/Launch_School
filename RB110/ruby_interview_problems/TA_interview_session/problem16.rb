=begin
# Write a function that finds all substrings that doesn’t contain any of the 
prohibited characters given in the second argument. -- Amar

# Test cases
puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
puts find_valid_substrings("12345", "3").inspect # [ '1', '12', '2', '4', '45', '5' ]
puts find_valid_substrings("abcde", "xyz").inspect
# [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 'b',
#   'bc', 'bcd', 'bcde', 'c', 'cd', 'cde',
#   'd', 'de', 'e'
# ]

Problem: Given two string arugments, return an array of elements

Rules:
- Given first string contains mix of lowercase alpha cars and/or digits
- Given second string contains chars that should not be present in return array
- Return an array of elements where
  - find all substrings that don't contain any prohibited chars
    - probhibited chars are chars denoted by the 2nd string argument
- Substrings are at least 1 char long and increase upto the end length of the string
- If given first string does not contain any chars frm given 2nd string
  - return ALL substrings

Examples:
- 'test', 't'
  - 't', 'te', 'tes', 'test'
  - 'e', 'es', 'est'
  - 's', 'st'
  - 't'
  -> 'e', 'es', 's' are the only substrings that do not contain 't'

- 'hello', 'el'
  - 'h', 'he', 'hel', 'hell', 'hello'
  - 'e', 'el', 'ell', 'ello'
  - 'l', 'll', 'llo'
  - 'l', 'lo'
  - 'o'
  -> 'h', 'e', only substrings without prohibited chars 'e' or 'l'

Algorithm:
- CREATE an array of prohibited chars
- CREATE anempty array of substrings
- CREATE valid substrings array
- FIND all substrings
  - ITERATE as many times as the length of the substring
    - for each char
      - ITERATE upto the length of the string
        - append substrings into empty holding array
- SELECT substrings that do not contain prohibited chars
  -ITERATE over prohibited chars
    - for each prohibted char
      - ITERATE over substrings
        - if the current substring does not contain the prohibited char
          - append it to valid substrings
        - else, move onto next substring
- RETURN unprohibited substrings


- FIND all substrings that do contain
=end

def find_valid_substrings(string, invalid_chars)
  invalid_chars = invalid_chars.chars
  substrings, valid_substrings = [], []
  invalid_substrings = []
  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      substrings << string[start_idx..end_idx] if !string[start_idx..end_idx].empty?
    end
  end

  invalid_chars.each do |char|
    substrings.each do |substr|
      if substr.include?(char)
        invalid_substrings << substr
      else
        next
      end
    end
  end

  substrings - invalid_substrings
#   valid_substrings.uniq
end



puts find_valid_substrings("test", "t").inspect # [ 'e', 'es', 's' ]
puts find_valid_substrings("hello", "el").inspect # [ 'h', 'o' ]
puts find_valid_substrings("12345", "3").inspect # [ '1', '12', '2', '4', '45', '5' ]
puts find_valid_substrings("abcde", "xyz").inspect
# [
#   'a', 'ab', 'abc', 'abcd', 'abcde', 'b',
#   'bc', 'bcd', 'bcde', 'c', 'cd', 'cde',
#   'd', 'de', 'e'
# ]

=begin
def find_valid_substrings(str, prohibited)
  valid_substrings = []

  # Helper method to check if the substring contains any prohibited character
  def contains_prohibited_chars?(substring, prohibited)
    prohibited.each_char.any? { |char| substring.include?(char) }
  end

  # Iterate through all possible substrings
  (0...str.length).each do |i|
    (i + 1..str.length).each do |j|
      substring = str[i...j]
      # If the substring does not contain any prohibited character, add it to the list
      valid_substrings.push(substring) unless contains_prohibited_chars?(substring, prohibited)
    end
  end

  valid_substrings
end
=end