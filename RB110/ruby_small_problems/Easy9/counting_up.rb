=begin
Write a method that takes an integer argument, and returns an Array of all 
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is 
greater than 0.

Examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

--- P
- GIVEN: integer argument
- RETURN: return array of integers where
          - the array contains a range of integers from 1..given_integer
            - first element starts at 1
            - last integer is the given argument
- integer argument will always be greater than 0
- assume that the givena rgument will always be an integer object

--- E
- given argument is 5
- array of integers frmo 1..5
  - [1, 2, 3, 4, 5]
  - numerical order
--- D
beginning: integer
intermediate: array to satisfy problem requirements
end: array

--- A
- CONSTRUCT a range from 1 to given num
- CONVERT range to array

=end

def sequence(integer)
  integer > 0 ? (1..integer).to_a : (integer..0).to_a
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(0) == [0]
puts sequence(-5) == [-5, -4, -3, -2, -1, 0]