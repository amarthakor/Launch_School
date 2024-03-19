=begin
A featured number (something unique to this exercise) is an odd number that 
is a multiple of 7, and whose digits occur exactly once each. So, 
for example, 49 is a featured number, but 98 is not (it is not odd), 
97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the 
next featured number that is greater than the argument. Return an error 
message if there is no next featured number.

Examples:
p featured(12) #== 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

--- P
- given: integer
- RETURN: integer
        - featured num is an odd num that is multiple of 7
          and whose digits occur exactly once each
        - 49 is a featured num, but 98 is not (98 is even)
        - 97 is not (nit multiple of 7)
        - 133 is not (digit 3 appears twice)

        - return the next featured num that is > than the argument
          based on the previously established rules
        - return error if there is no next featured number

- featured num:
  - multiple of 7
  - is odd
  - each digit only appears once in the number
  find next featured num of givena arg

- featured num does not include current num
- any number greater than 10 digits long will repeat and therefore fail
- cap is at 10 digits long -> 9,876,543,210
--- E
- featured(9_999_999_999) any number greated
  - has no featured num as digits will repeat at this point



--- D
beginning: integer
middle: basic loop
end: integer

--- A
- RETURN error if the given num is greate than 9,876,543,210
- LOOP over the current num
  - BREAK if the current num is:
    - divisble by 7
    - is odd
    - each digit in num only appears once
  - OTHERWISE increment num by +1
- RETURN num

=end


def featured(number)
  return 'There is no possible number that fulfills those requirements.' if number > 9876543210

  loop do
    number += 1
    break if (odd_factor(number)) && (uniq_digits(number))
  end

  number
end

def uniq_digits(num)
  num = num.digits
  num.all? {|digit| num.count(digit) == 1 }
end

def odd_factor(num)
  (num % 7 == 0) && (num.odd?)
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements