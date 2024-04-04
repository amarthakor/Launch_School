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
- GIVEN an array of integers, return nil or an integer

Rules:
- Return nil if array size is less than 5
- Return integer should be the minimum sum of 5 consecutive integers

--- E


--- D


--- A
- RETURN nil if array size is less than 5
- CREATE all subarrays of 5 consecutive integers
  - iterate thru the string and find all pairs of 5 consec integers
    - stop iterating when size is no longer 5
- FIND all the sums of subarrays
  - move to a placeholder array
- RETURN the smallest sum of subarrays
  - check all nums in placehodler array to see smallest value

=end


def minimum_sum(numbers)
  return nil if numbers.empty?
  five_nums = []

  (numbers.size - 4).times do |start_idx|
    five_nums << numbers[start_idx..start_idx + 4]
  end

  five_nums.map { |subarr| subarr.sum }.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10