=begin
Write a method that takes one argument, an array containing integers, and 
returns the average of all numbers in the array. The array will never be 
empty and the numbers will always be positive integers. Your result should 
also be an integer.

Don't use the Array#sum method for your solution - see if you can 
solve this problem using iteration more directly.

Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

--- P
- GIVEN: array of integers
- RETURN: integer derived from the average of the given array integers
  - array argument integers will always be positive
  - will never have an empty array
  - elements will always be integers and not other objects

--- E
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3

--- D
beginning: array of integers
intermediate: use array to perform calculations for each element
end: integer

--- A
- FIND the sum of the array using iteration
- DIVIDE the total sum by the array size
- RETURN the final output


=end

def average(array)
  array.inject(:+) / array.size
end

# solution using iteration over array collection
def average1(array)
  total = 0
  array.each { |num| total += num }
  result = total / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average1([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average1([1, 5, 87, 45, 8, 8]) == 25
puts average1([9, 47, 23, 95, 16, 52]) == 40
