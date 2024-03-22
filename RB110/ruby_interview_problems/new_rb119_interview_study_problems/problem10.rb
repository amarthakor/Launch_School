=begin
Create a method that takes a string of digits as an argument and returns 
the number of even-numbered substrings that can be formed. For example, 
in the case of '1432', the even-numbered substrings are '14', '1432', '4', 
'432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as 
a separate substring.

Examples:
p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

Problem: Given a string of digits, return the number of even number substrings that can be
         formed.

Rules:
- If a substring occurs more than once, each occurrence should be counted
- If all digits are odd, return 0
- Find all possible substring combinations starting from the first digit to the last
  that are divisble by 2

Algorithm:
- RETURN 0 if every digit in the string is odd
- CREATE an array to hold all substrings
- CREATE all substring values of the given string
- SELECT the strings where the integer representation would be evenly divisble by 2
- RETURN the count of selected substrings
=end

def even_substrings(string)
  return 0 if string.chars.map { |num| num.to_i.odd? }.all?
  substrings = []

  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      substrings << string[start_idx..end_idx]
    end
  end

  substrings.select { |num| num.to_i % 2 == 0 }.count
end


p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12