=begin
Create a method that takes an array of integers as an argument. Determine and 
return the index N for which all numbers with an index less than N sum to the 
same value as the numbers with an index greater than N. If there is no index 
that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the 
smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the 
numbers to the right of the last element is 0.

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0


Problem: Given an array of integers, return an integer that represents an index

Rules:
- Index returned must be such that the integers to the right of the current idx
  and the integers to the left of the current idx have the same sum
- If there is no idx value that this can happen at, return -1
- If there are multiple indexes that satifisy the rules,
  - RETURN the SMALLEST index
- Sum of numbers to the left of idx 0 is 0
- Sum of numbers to the left of idx -1 is 0

Algorithm:
- ITERATE over the given array
  - for each number
    - find the sum of nums to the left of the current num AND to the right of
      the current num.
    - if these two sides are equal
      - return the index of the current num

=end

def equal_sum_index(numbers)
  last_idx = numbers.size - 1

  numbers.each_with_index do |num, idx|
    return idx if numbers[0...idx].sum == numbers[idx + 1..last_idx].sum
  end

  -1
end


p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([1, 2, 3, 4, 5]) == -1
# # The following test case could return 0 or 3. Since we're
# # supposed to return the smallest correct index, the correct
# # return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0