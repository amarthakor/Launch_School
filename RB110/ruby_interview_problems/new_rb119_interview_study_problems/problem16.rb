=begin
Create a method that returns the count of distinct case-insensitive 
alphabetic characters and numeric digits that occur more than once in 
the input string. You may assume that the input string contains 
only alphanumeric characters.

Examples:
p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5


Problem: Given a string, return an integer

Rules:
- Return integer represents a count of:
  - alphabetic chars that occur more than once
  - numeric digits that occur more than once
- Case does not matter
- String only contains alphanumerical chars

Algorithm:
- CREATE a counter variable and set it to 0
- FIND all uniq chars
- ITERATE over lowercased uniq chars
  - for each uniq char
    - if the count of the current char in the orginal downcased string is > 1
      - increment my counter var by 1
- RETURN counter

=end

def distinct_multiples(string)
  more_than_one = 0

  unique_chars = string.downcase.chars.uniq

  unique_chars.map do |char|
    more_than_one += 1 if string.downcase.count(char) > 1
  end
  
  more_than_one
end




p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5