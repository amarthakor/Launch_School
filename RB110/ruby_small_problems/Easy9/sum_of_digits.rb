=begin

Write a method that takes one argument, a positive integer, and 
returns the sum of its digits.

Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

The tests above should print true.

For a challenge, try writing this without any basic looping constructs
(while, until, loop, and each).

--- P
- GIVEN: positive integer
- RETURN: sum of its digits

- assume input will always be an integer greater than 0
--- E
sum(496) -> 4 + 9 + 6 = 19

--- D
beginning: integer
intermediate: array to find the sum of total elements
end: integer

--- A
- CONVERT integer into string then into array
- CONVERT all string elements back into integer elements
- FIND the sum of all array elements
  - #sum? #inject

=end

def sum(number)
  number.digits.sum
end

# solution without using #digits method
def sum1(number)
  number.to_s.split('').map { |num| num.to_i }.inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts sum1(23) == 5
puts sum1(496) == 19
puts sum1(123_456_789) == 45