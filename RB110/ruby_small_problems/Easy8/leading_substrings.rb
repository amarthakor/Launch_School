=begin
Write a method that returns a list of all substrings of a string that start
 at the beginning of the original string. The return value should be arranged 
in order from shortest to longest substring.

Examples:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


--- P
- GIVEN: string
- RETURN: array of all possible substring
        - possible substrings always start with first char (0 indeex)
        - incremently increase by 1 char each substring (0..x, where x increases by 1 until we reach
                                                            the entire string)
        - should be oredered from shortest to longest substring length


--- E
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']

--- D
beginning: string
intermediate: array to iterate over each character and form all possible substrings
end: array

--- A
- CONVERT string into array of chars
  - #chars
- FIND all possible substrings
  - for each iteration, 
    - push current char(s), starting at 0 index, upto current char into new array
- SORT all strings by character length
  - #sort? sortby?

=end

def leading_substrings(str)
  results = []
  str.chars.each_with_index do |char, idx|
    results << str[0..idx]
  end
  results
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
