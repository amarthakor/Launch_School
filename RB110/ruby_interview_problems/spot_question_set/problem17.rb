=begin
Write Number in Expanded Form

You will be given a number and you will need to return it as a string 
in Expanded Form. 
For example:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.


Problem: Given an integer, return a string

Rules:
- Return string is a representation of the integer arugment where
  - Each place value is added to create the given argument

Example:
- 70304
  - ten thousands place, thousands place, hundreds place, tens place, ones place
    - 70,000 + 0,000 + 300 + 00 + 4 == "70000 + 300 + 4"

- Need to find as many placeholders except when 0
- Then combine those values using a +

Algorithm:
- CONVERT the number into an array reversde
- ITERATE upto array size times
  - for each digit in the array
    - multiply it by a factor of 10 starting from 0 upto the array size
    - push all values into a new array
- SELECT all values that aren't 0
- REVERSE and JOIN all elements by ' + '

=end

def expanded_form(number)
  number = number.digits
  results = []
  0.upto(number.size - 1) { |num| results << number[num] * (10**num) }
  results.select { |num| num == 0 ? false : true }.reverse.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'