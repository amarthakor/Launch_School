=begin
- Write a method that takes an integer, and converts it to a string
- representation. The integer maybe positive or negative.

--- P
- Create a method that takes a pos/neg integer and returns the string
- form of the given integer.


--- E
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

if 0, string returned should be not be prefaced with + or -
if positive, string returned should be prefaced with +
--- D
will use array to transform array into string


--- A
- RETURN '0' if number is equal to 0
  - return '0' if number == 0
- CREATE an empty array
  - initalize an array
    - number_array = []
- MOVE number into an array
  - append the number into the array
    - number_array << number
- RETURN the string version of the integer provided
  - if the absolute value of number is equal to number, return the positive string version
    - if number == number.abs
        - '+' + number_array.join
  - if the abs value of num is NOT equal to num, return the negative string version
    - else number != number.abs
      - '-' + number_array.join
=end

def signed_integer_to_string(number)
  return '0' if number == 0
  number_array = []
  number_array << number

  number == number.abs ? ('+' + number_array.join) : (number_array.join)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'