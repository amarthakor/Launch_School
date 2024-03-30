=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5,
 we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 
below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

Problem: Given an integer, return a new integer


Rules:
- Given an integer
  - Find all multiples of 3 or 5 upto n - 1
  - Remove all duplicates
  - Sum those multiples

- Multiples of 3 and 5 only count once
- Assume given will always be valid

Algorithm:
- CREATE a factors array
- ITERATE from 3 upto the given integer - 1
  - For each number
    - if it is eenly divisble by 3 or 5
      - append it into the factors array
- REMOVE all duplicates from the factors array
- SUM the entire factors array

=end

def solution(target)
  factors = []
  
  3.upto(target - 1) { |num| factors << num if num % 3 == 0 || num % 5 == 0 }

  factors.uniq.sum
end



p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
