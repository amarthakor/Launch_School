# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.
# A running total is the sum of all values in a list up to and including the
# current element. Thus, the running total when looking at index 2 of the array
# [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is
# 47 (14 + 11 + 7 + 15).
#
# P
#
# Write a method that takes a given Array of numbers and returns an array with the
# same number of elements as the given array, but each element in the new array
# has the total sum from itself and the elements prior based off the original array
# input: array
# output: array
#
# Explicit rules
# - Input will be an array of integers only
# - Out put will be an array of integers with equal amount of elements as input array
# - Output array elements will be the sum of itself and the integer(s) before it 
#       from the original array
# Implicit rules
# - If array is empty return empty array
# - If only one element is provided within array input, return same array
#
# E
#
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []
#
# D
#
# beginning: array of integers
# intermediate: remain in array data type to allow easy iteration over collection
# ending: array of integers
#
# A
#
# initialize total var to 0 to represent the sum of the element + prior elements
#  for each element, increment total by the current element

def running_total(numbers)
  total = 0
  numbers.map do |num|
    total += num
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []





