=begin
Create a method that takes an array of integers as an argument and returns
the integer that appears an odd number of times. There will always be exactly
one such integer in the input array.

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0


Problem: Given an array of integers, return an integer

Rules:
- Return integer will appear an odd amount of times
- Every other integer will appear an even amount of times
- There is only 1 integer w/ occurence sum that is odd

Algorithm:
- ITERATE over the array of nums
  - for each number
    - if the number of times the current num appears in the array is odd (its count)
      - return that number
    - else move onto the next number

=end

def odd_fellow(numbers)
  numbers.each { |num| return num if numbers.count(num).odd? }
end


p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0