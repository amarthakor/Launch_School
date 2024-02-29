=begin
Create a method that takes two integers as arguments. The first argument is a count, 
and the second is the first number of a sequence that your method will create. 
The method should return an Array that contains the same number of elements as the
count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, 
while the starting number can be any integer value. If the count is 0, an empty 
list should be returned.

Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

--- P
- GIVen: two integers
        - first integer is represents how many numbers/times the operation should be performed
        - second integer represents the starting point of the array and acts as a multiple
          of how much each following number should be incremeneted by
- if count is 0, an empty array should be returned
- count value will never be negative

--- E
- sequence(4, -7) == [-7, -14, -21, -28]
  - count represents # of elements in array
  - 2nd arg represents multiple and starting value
  - therefore start at -7 and add multiples until count times has been reached
--- D
beginning: integers
intermediate: array to create elements based off given input
end: array of ntegers

--- A
- CREATE empty array
- CREATE multiples of 2nd argument, first argument times
  - #times? #upto?
- RETURN results array

=end

def sequence(count, multiple)
  factors = []
  1.upto(count) { |num| factors << multiple * num }
  factors
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []