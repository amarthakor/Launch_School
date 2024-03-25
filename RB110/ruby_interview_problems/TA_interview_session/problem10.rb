=begin
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

--- P
- GIVEN: array of integers
- RETURN: return the sum of 5 consecutive integers
          - if array has less than 5 integers, return nil
- what does minimum sum mean?
  - smallest total sum possible
- what does 5 consecutive integers mean?
  - one after the other

--- E


--- D


--- A


=end