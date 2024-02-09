=begin
- Write a method that takes a String of digits, and returns the appropriate
- number as an integer. The String may have a leading + or - sign; if the first
- character is a +, your method should return a positive number; if it is a -,
- your method should return a negative number. If no sign is given, you should
- return a positive number.

- You may assume the string will always contain a valid number.

--- P
- Create a method that takes a string number (positive or engative) and returns
- that number as its integer form.
  INPUT: take in string number, + string number, or - string number
  OUTPUT: return positive or negative integer based off given input


--- E
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100


--- D



--- A
- Utilize already built string to int method from previous problem;
- If the first characgter in the string is '+'
    - call string_to_int method with given string from the first index to the last index
- elsif the first char in the string is '-'
    - call string_to_int method and multiply it by -1 from the first index to the last index
- If the first character in the string is neither '+' or '-'
    - call string_to_int method with given string

=end

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
'8' => 8, '9' => 9}

def str_to_int(string)
  digits = string.chars.map { |char| DIGITS[char] }

  results_number = 0
  digits.each { |num| results_number = num + results_number * 10 }
  results_number
end

def string_to_signed_integer(string)
  last_index = string.size - 1
  if string[0] == '+'
    str_to_int(string[1..last_index])
  elsif string[0] == '-'
    -str_to_int(string[1..last_index])
  else
    str_to_int(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
puts string_to_signed_integer('+123124432') == 123124432
puts string_to_signed_integer('-1249532942') == -1249532942