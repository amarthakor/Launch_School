=begin
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

--- P
- GIVEN: integer, 2nd arugment is a POSITIVE integer
- RETURN: array of integers with specified # of last digits rotated
        - return given array of given integer is 1
        - when given argument > 1, find the element at that position and
          put it in the end of the array, leave every other digit alone
--- E
- rrd(735291, 1) == 735291 unchanged
- rrd(735291, 4) == 735912 #fourth digit, 2, gets shifted to the end
- position indicators begin with at least 1, which indiciates last digit, and
     increase by 1 which progressively move to the left until the 
     number of digitis in the integer == index 0
- move from the end digit to the front digit
  - position digit goes from 1 and is incremented by +1 upto the length of the integer
--- D
begin: integer, integer
middle: array or string to modify individual digits
end: integer

--- A
- RETURN integer if second argument is equal to 1
- CONVERT integer to string
- CREATE variable assigned to the target digit
- DELETE the target digit
- APPEND the target digit to the end of the enw variable
- CONVERT back to integer

=end

def rotate_rightmost_digits(number, position)
  number = number.to_s
  target_position = number[-position]
  number = number.delete(target_position)
  number << target_position
  number.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
