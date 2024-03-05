=begin
If you take a number like 735291, and rotate it to the left, you get 352917. 
If you now keep the first digit fixed in place, and rotate the remaining digits, 
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. 
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, 
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum 
rotation of that argument. You can (and probably should) use the rotate_rightmost_digits
method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

--- P
- GIVEN: integer argument
- RETURN: intger argument that is the maximum rotation of the given arg
        - maximum rotation starts with rotating the first digit
          then rotating each consecutive number until eventually the entire
          argument has been rotated
- ignore special characters like _
- if integer is one digit, return same num
- amount of rotations is digit size - 1
--- E
- 735
  - 357
  - 375

-735291
  - 352917
  - 329175
  - 321759
  - 321597
  - 321579

--- D
begin: integer
mid: string
end: integer

--- A
- RETURN given integer if integer length is 1
- FIND the length of the integer - 1
- Iterate from 0 to the 2nd to last digit
  - string -1 . times
  - remove the character specified by upto

=end

def max_rotation(number)
  p number
  number = number.digits.reverse
  rotations = number.size - 1

  rotations.times do |num|
    p number
    rotated_value = number.delete_at(num)
    p number
    number << rotated_value
  end

  number.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845