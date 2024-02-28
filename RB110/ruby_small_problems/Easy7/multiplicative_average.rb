=begin

Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array,
and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

Examples:
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

---------------------------------------------------------------------------
--- P
GIVEN: Array of integers
RETURN: STRING, where
      - multiply all elements in array together (inject?)
      - divide product by size of array (#size)
      - final answer should have 3 decimal places
          kernel #format?
      - "The result is #{result}"
--- E
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
  - 2 * 5 * 7 * 11 * 13 * 17 = 170170
  - array has 6 elements
  - product / array size -> 170170 / 6 = 28361.666666666666
  - round to 3 decimal palces -> 28,361.667 == 28,361.667
--- D
beginning: array of integers
intermediate: maintain array to allow easy modifications and mathamatical processes
ending: interpolated string

--- A
- FIND the product of my array of integers
  -inject
- FIND the size of my array and convert to float
  - array#size
  - to_f
- DIVIDE the product by the size of the array
  - product / size
- INTERPOLATE a string with my result, rounded to 3 decimals
  - kernal format to round to 3 decimals
=end

def show_multiplicative_average(array)
  product = array.inject(:*)
  divisor = array.size.to_f
  result = product / divisor
  puts "The result is #{format('%.3f', result)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
