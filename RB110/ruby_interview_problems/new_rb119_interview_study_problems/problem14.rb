=begin
Create a method that takes a single integer argument and returns the sum 
of all the multiples of 7 or 11 that are less than the argument. If a 
number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 
21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

Examples:
p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

Problem: Given an integer return an integer

Rules:
- Return integer is the sum of all multiples of 7 or 11 that are less than the given itneger
- If a number is a multiple of both 7 and 11, count it only once
- Return 0 if the argument is negative

Examples:
10 -> 7
  - 7

11 -> 7
  - 7
  - not inclusive

12 -> 18
  - 7
  - 11

Algorithm:
- CREATE a factors array
- FIND all factors
  - ITERATE from 7 upto the target number
  - for each number
    - if its evenly divisble by 7 or 11, 
      - append it to the factors table
- FIND all unique factors
- SUM all unique factors
=end

def seven_eleven(target)
  return 0 if !target == target.abs
  factors = []

  7.upto(target - 1) do |num|
    factors << num if (num % 7 == 0) || (num % 11 == 0)
  end

  factors.uniq.sum
end





p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0