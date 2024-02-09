=begin
Write a method that takes a positive integer or zero, and converts it to a
string representation.

int_to_string(1234) == '1234'

--- P
- Create a method that takes a positive integer and returns the string version
  - Cannot use #to_s, #to_i, etc.
  INPUT: integer
  output: string

--- E
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

--- D
- hash would allow pairing of integer with its respective string value
- and retrieval of string value

--- A
- CREATE a hash of integers 0-9 with pairs as the respective string version
- CREATE an array composed of digits of the given number
  - convert the number into an array where each element is a digit of number
    - number.digits.reverse?
- TRANSFORM the array of digits into strings and ASSIGN it to a variable
  - initialize the variable and set it to the return value 
    - 'string_number'
  - Iterate over each element to return its string version
    - Use map to iterate over the string
    - Use hash syntax to obtain the string value of the key integer from the
      DIGITS hash
- CONVERT the array of string elements into a string (#join?)
  - use the #join method to collapse the array into a string
- RETURN the string

-------------------------------------------------------------------------------
- CREATE an empty array
  - Initialize an array
    - results_array = []
- MOVE the given number into the empty array
  - Append the argument into results_array
    - results_array << integer_argument
- TRANSFORM the array into a string
  - results_array.join

=end

def integer_to_string(number)
  results_array = []
  results_array << number
  results_array.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
           6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def intege_to_string(number)
  number = number.digits.reverse
  
  string_number = number.map do |digit|
    DIGITS[digit]
  end.join

end

puts intege_to_string(4321) == '4321'
puts intege_to_string(0) == '0'
puts intege_to_string(5000) == '5000'