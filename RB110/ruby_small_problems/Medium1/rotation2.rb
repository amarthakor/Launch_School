=begin
6:58pm
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want.
(Recommended!)

You may assume that n is always a positive integer.

Problem: Given two integer args, return an integer

Rules:
- Given two integers
  - First arg is a number
  - Second arg represents the place of the digit i want to rotate in first 
    arg from the end of the first arg
- ROTATING 1 digit results in the original number being returned
  - this is because the last digit is rotated with itself, thus it stays in the same spot
- amount of digits rotated will always be positive

- Given a second arugment, n, find the place value of n, starting from the last digit moving left
  - and move that digit to the end, while shifitng everything else over by one
- Doesn't mention whether new array or oriignal array
Examples:
-735291, 2 -> 735219
- 735291, 3 -> 735912
- 735291, 4 -> 732915
- 735291, 5 -> 752913

Algorithm:
- CONVERT first arg to an array of digits # digits
  - use #digits, then reverse the array
- REMOVE the digit at the given index value that matches the 2nd argument
  - set rotated_digit to index of the target digit
  - use negative index value delete digit
- MOVE that digit to the end of the array
  - push rotated_Digit value to end of array
- JOIN array into an integer again
  - join to_i
=end

def rotate_rightmost_digits(number, digit)
  number = number.digits.reverse
  rotated_digit = number[-digit]
  number.delete_at(-digit)
  number << rotated_digit
  number.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917