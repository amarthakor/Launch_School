=begin
Create a method that takes two string arguments and returns the number 
of times that the second string occurs in the first string. Note that 
overlapping strings don't count: 'babab' contains 1 instance of 'bab', 
not 2.

You may assume that the second argument is never an empty string.

Examples:
p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

Problem: Given two string arguments, return the number of times that the 
         second string argument appears in the first string.

Input: Two string arguments
Output: Integer

Rules:
- Return 0 if first argument is empty
- If the second string argument is not contained w/n the first, return 0
- Overlapping strings don't count
  - i.e. 'babab', 'bab' returns 1, has 'bab' fits once not twice

Algorithm:
- RETURN 0 if either string1/2 are not contained w/n each other
- REPLACE all occurrences of the second string within the first string with ' '
- COUNT all whitespaces
- RETURN that count
=end

def count_substrings(str1, str2)
  return 0 if !str1.include?(str2)
  str1.gsub!(str2, ' ').count(' ')
end


p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1