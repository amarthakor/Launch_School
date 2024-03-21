=begin
Create a method that takes an array of integers as an argument. The method should 
return the minimum sum of 5 consecutive numbers in the array. If the array contains 
fewer than 5 elements, the method should return nil.

Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

Problem:
- Return the minimum sum of 5 CONSECUTIVE numbers from the given array
- If the given array has less than 5 integers, return nil
- In this case, CONSECUTIVE means one after the other
- numbers in array may be negative as well

- Input: array of integers
- Output: minimal sum integer

Examples:
[1, 2, 3, 4] -> nil
  - We reutrn nil bc side is less than 5

[1, 2, 3, 4, 5, -5] -> 9
  - [1, 2, 3, 4, 5] == 15 or [2, 3, 4, 5, -5] == 9
    - return 9 as it is the smallest sum

Data Structures:
- maintaing array would easily allow to come up with consecutive array
  combinations as well as sum each array easily

Algorithm:
- RETURN nil if array size is less than 5
- CREATE a results array
- CREATE all possible subarrays of 5 consecutive integers
  - FIND its sum and append it to the results array
- RETURN the smallest num in the results array
=end

def minimum_sum(numbers)
  return nil if numbers.size < 5
  all_sums = []

  (numbers.size - 4).times do |start_point|
    all_sums << numbers[start_point..start_point + 4].sum
  end
  
  all_sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10