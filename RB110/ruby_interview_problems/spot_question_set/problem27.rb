=begin
Create a method called "power" that takes two integers and returns 
the value of the first argument raised to the power
of the second. Return nil if the second argument is negative.
Note: The ** operator has been disabled.


Examples:
p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

Problem: Given two integers, return an integer or nil

Rules:
- Return nil if second arugment is negative
- ** operator disabled
- Return argument is the results of the
  first argument raised to the power of the 2nd argument

Examples:
- 2^3
  2 * 2 * 2 = 8

- -5 ^ 3
  -5 * -5 * -5 = -125

algorithm:
- RETURN nil if 2nd argument is negative
- ITERATE power times
  - for each iteration
    - append base into an array
- FIND the product of each element multiplied by each other
- IF the array is empty, return 1, otherwise return the multipled product

=end

def power(base, power)
  return nil if power < 0
  factors = []
  power.times { |num| factors << base }
  factors.empty? ? 1 : factors.inject(:*)
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil