=begin
Write a method that returns a list of all substrings of a string. 
The returned list should be ordered by where in the string the substring 
begins. This means that all substrings that start at position 0 should 
come first, then all substrings that start at position 1, and so on. 
Since multiple substrings will occur at each position, the substrings 
at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in 
the previous exercise:

Examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

--- P
- GIVEN: string
- RETURN: array of strings where;
        - strings consist of substrings of original string
        - substrings should be ordered by index
          - this means that all substrings that begin with the first char should
            appear before substrings that start with the second char
        - what is a substring?
          - a substring is the smallest to largest arrangement of characters
            starting from the first index to the last index, then we move to the next
            character and repeat the process
  
- assume if string empty that we return empty array
--- E
- substrings(abcde)
  - [ a, ab, abc, abcd, abcde
      b, bc, bcd, bcde,
      c, cd, cde, 
      d, de,
      e ]


--- D
beginning: string
intermediate: array to satisfy prob req's and also iterate over string to create elements
ending: array of substrings

--- A
- CREATE a results array
- ITERATE over the given string where
  - for each character
    - iterate string size - 1 times where within each iteration
      - for each iteration append the current range index from start idx to end idx
      

=end

def substrings(string)
  return [] if string.empty?
  results = []

  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      results << string[start_idx..end_idx]
    end
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]