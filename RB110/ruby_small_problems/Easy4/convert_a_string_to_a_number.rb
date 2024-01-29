# ----- P
# - Write a method that takes a string composed of digits, and returns the appropriate 
# - number as an integer, without using standard conversion methods such as String#to_i
# - Input: string of digits
# - Output: integer value
#
# Explicit rules:
# - cannot use conversion methods such as String#to_i method
#
# Implicit rules:
# - arguments will only be string objects
#
# Clarifying questions
# - What should we expect if empty string is passed?
#     - Should we return 0 or something else?
# - How should we deal with strings that contain decimal values?
#
# ------ E
#
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570
#
# D
# -- hash will allow KV pairs of string digits to integer 0-9
#
# ------ A
#
# - Create global hash that matches string char w/ its respective int value
#   - Create a hash where all keys reference string values '0'-'9'
#   - Set values for keys as their respective integer counterpart
#         - ('9' => 9)
# - Split string into an array where elements are individual letters
# - Transform array of string chars into array of integer values
# - Transform each individual str character into integer equivalent and add
#   that number to results_number
#    - initialize results_number to reference final integer value
#    - for each int, reassign results_number to current digit + results_number * 10
#       to increment each digit by 1 increased place value
#       (i.e. ones, tens, thousands, etc.)

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
'8' => 8, '9' => 9}

def str_to_int(string)
  digits = string.chars.map { |char| DIGITS[char] }

  results_number = 0
  digits.each { |num| results_number = num + results_number * 10 }
  results_number
end

p str_to_int('570') == 570
p str_to_int('4321') == 4321