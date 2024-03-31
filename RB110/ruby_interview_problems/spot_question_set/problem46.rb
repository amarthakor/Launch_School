=begin
In this kata, you must create a digital root function.
A digital root is the recursive sum of all the digits in a number. 
Given n, take the sum of the digits of n. If that value has
more than one digit, continue reducing in this way until a single-digit 
number is produced. This is only applicable to the
natural numbers.

Here's how it works:
digital_root(16)
=> 1 + 6
=> 7
digital_root(942)
=> 9 + 4 + 2
=> 15 ...
=> 1 + 5
=> 6
digital_root(132189)
=> 1 + 3 + 2 + 1 + 8 + 9
=> 24 ...
=> 2 + 4
=> 6
digital_root(493193)
=> 4 + 9 + 3 + 1 + 9 + 3
=> 29 ...
=> 2 + 9
=> 11 ...
=> 1 + 1
=> 2

Problem: Given an integer, return a new integer

Rules:
- Return digital root
  - Digital root is the sum of all digits in a number until there is only 1 digit left
- Only works on natural numbers
  - whats a antural number? whole number? positive numbeR?

Examples:
- 456
  - 4 + 5 + 6 = 15
  - 1 + 5 = 6
  -> 6

Algorithm:
- RETURN the sum of digits of the number if the sum of the number is single digits
- SET variable to given number
- LOOP over the given number
  - SET variable to CONVERT the num into an array of digits and find its sum
  - BREAK out of the loop if the variable size is 1 digit long
- RETURN variable value

=end

def digital_root(number)
  sum_of_digits = number.digits.sum

  loop do
    sum_of_digits = sum_of_digits.digits.sum
    break if sum_of_digits.digits.size == 1
  end

  sum_of_digits
end


p digital_root(16) == 7
p digital_root(456) == 6