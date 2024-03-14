=begin
A prime number is a positive number that is evenly divisible only by itself 
and 1. Thus, 23 is prime since its only divisors are 1 and 23. However, 
24 is not prime since it has divisors of 1, 2, 3, 4, 6, 8, 12, and 24. Note 
that the number 1 is not prime.

Write a method that takes a positive integer as an argument and returns true 
if the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to 
programmatically determine whether a number is prime without relying on any 
methods that already do that for you.

Examples:
puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true

--- P
- given: integer
- return: boolean true or false where;
        - if the given integer is ONLY divisble by 1 and itself, return true
        - if there are any other factors that multiply to the integer value, return false
        - 1 is not a prime number
        - arg will be positive integer
        - cannot use #prime

--- E
- 1 == false
  - 1 is not a prime number

- 23 == ture
  - 1 and 23 are only factors of 23

- 24 == false
  - 1, 2, 3, 4, 6, 8, 12, 24 are all factors of 24

--- D
begin: integer
middle: array to hold factors of num
end: boolean

--- A
- RETURN false if integer is 1
- INITIALIZE a factors array 
- ITERATE from 2 to the target num
  - check if each num is evenly divisble into the target num
    - if it is, append it to factors array
  - if not, continue to the next number
- COUNT the number of factors in the factor array
  - if it only has 1, return true
  - otherwise, return false

=end

def is_prime(number)
  return false if number == 1
  factors = []
  2.upto(number) { |num| number % num == 0 ? factors << num : num }
  factors.size == 1 ? true : false
end

p (is_prime(1) == false)              # true
p (is_prime(2) == true)               # true
p (is_prime(3) == true)               # true
p (is_prime(4) == false)              # true
p (is_prime(5) == true)               # true
p (is_prime(6) == false)              # true
p (is_prime(7) == true)               # true
p (is_prime(8) == false)              # true
p (is_prime(9) == false)              # true
p (is_prime(10) == false)             # true
p (is_prime(23) == true)              # true
p (is_prime(24) == false)             # true
p (is_prime(997) == true)             # true
p (is_prime(998) == false)            # true
p (is_prime(3_297_061) == true)       # true
p (is_prime(23_297_061) == false)     # true
