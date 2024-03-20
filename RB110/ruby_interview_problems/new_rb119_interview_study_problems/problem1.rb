=begin
Create a method that takes an array of numbers as an argument. For each number,
determine how many numbers in the array are smaller than it, and place the 
answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs 
multiple times in the array, it should only be counted once.

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2] # true
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0] # true
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3] # true
p smaller_numbers_than_current([1]) == [0] # true

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

Problem:
  - Given an array of integers
  - Return a new array of integers

Requirements:
  - For each number
    - determine how many numbs in the array are smaller than it
    - this new number will replace the original number
  - Only count uniq values

Examples:
[8, 1, 2, 2, 3]
  - 8 is the biggest number in the array
    - there are 4 numbers smaller than 8
    - one has a duplicate
    - 3 unique smaller values
[3, x, x, x, x]
  - 1 is the smallest number in the array
    - therefore no numbers are smaller than it
[3, 0, x, x, x]
  - 2 is bigger than 1 other number (1)
[3, 0, 1, x, x]
  - 2 is bigger than 1 other number (1)
[3, 0, 1, 1, x]
  - 3 is the second biggest number in the array
    - 3 numbers are smaller, but two of them are the same
    - therfore, bigger than only 2 numbers
[3, 0, 1, 1, 2] return array

Algorithm:
- ITERATE over given array
  - for each number
    - find the count of how many unique numbers are smaller than the given num
    - push that count into the results array
- RETURN results array

=end

def smaller_than_current(numbers)

  numbers.map { |num| numbers.uniq.count { |number| num > number } }

end

p smaller_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_than_current(my_array) == result