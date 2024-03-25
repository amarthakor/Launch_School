=begin
Create a method that takes an array of numbers, all of which are the 
same except one. Find and return the number in the array that differs 
from all the rest.

The array will always contain at least 3 numbers, and there will always 
be exactly one number that is different.

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3


Problem: Given an array of integers or float, return an integer or float

Rules:
- All numbers are the same except one
- Find the num that is different and return it
- Array will always contain at least 3 numbers
- Always be exactly one num that is different

- Thus, in each array, the count of the different_number will always be 1

Algorithm:
- ITERATE over given array
  - for each element
    - Find the count for the current number
      - if the count is equal to 1
        - return that number
      - otherwise move onto the next number

=end

def what_is_different(numbers)
  numbers.each { |num| return num if numbers.count(num) == 1 }
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3