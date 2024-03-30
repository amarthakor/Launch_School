=begin
Given an integer n, find the maximal number you can obtain by deleting
exactly one digit of the given number.

Example
For n = 152, the output should be 52;
For n = 1001, the output should be 101.

Input/Output
[input] integer n
Constraints: 10 ≤ n ≤ 1000000.
[output] an integer


Problem: Given an integer, return an integer

Rules:
- Return integer is the maximum number that can be created by removing 
  - a digit from the given number
- Given integer will be from 10..1000000

Examples:
- 152
  - 15, 52, 12 -> 52 is the max

Algorithm:
- CREATE an array of possible values

- CONVERT integer to string
- CONVERT string to array of chars
- ITERATE over array of chars 
  - for each char
    - delete the current char and append the value into the results array
    - reassign the var to the original array of chars

- ITERATE over all results and transform into numbers
- SELECT the max number
=end

def delete_digit(number)
  results = []
  num_str = number.to_s.chars

  num_str.size.times do |idx|
    num_str.delete_at(idx)
    results << num_str.join
    num_str = number.to_s.chars
  end

  results.map { |num| num.to_i }.max
end


p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1