# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.
# Examples:
# 5:06pm 5:17pm
# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.

# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4
# + 7 + 14 = 28.

# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9
#  which is less than 15.

# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and
#  1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.

# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or deficient.

=begin

--- P
Problem : Given a number, return a string

Rules:
- Three types of numbers
  - perfect
    - divisors add up to number
  - deficient
    - divisors sum < number
  - abundant
    - divisors sum > number
- Must raise StdError if number is negative
  - what about 0?
--- E
- 13 -> 'deficient'
  1 < 13

- 28 -> perfect
  1, 2, 4, 7, 14
  28 == 28

- 12 -> abundant
  1, 2, 3, 4, 6
  16 > 12

- -1 -> StdError
  must be positive number

--- D
- use array to find divisors and then compute sum

--- A
- DO NOT need constructor method
- CREATE class method that takes 1 argument, target_num #classify
  - RAISE StandardError if argument is less than 0
  - CREATE array to hold even divsors
  - FIND all even divisors
  - SUM the even divisors
  - IF the sum == target_num
    'perfect'
  - ELSIF the sum > target_num
    'abundant'
  - Else
    'deficient'

=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0
    divisors = []

    1.upto(num - 1) { |divisor| divisors << divisor if num % divisor == 0 }

    if divisors.sum == num
      'perfect'
    elsif divisors.sum > num
      'abundant'
    else
      'deficient'
    end
  end
end
