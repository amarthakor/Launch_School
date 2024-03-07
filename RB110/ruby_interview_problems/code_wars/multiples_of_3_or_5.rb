=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5
below the number passed in.

Additionally, if the number is negative, return 0.
Note: If the number is a multiple of both 3 and 5, only count it once.

--- P
- Given: a target number to count upto but not include
- RETURN: the total sum of all multiples of 3 and 5 upto but not including
          the target num
  - if the target num is negative, return 0
  - if the number is a multiple of both 3 and 5, only count it once

--- E
- 10
  - 3, 6, 9
  - 5
  = 23


- 20
  - 3, 6, 9, 12, 15, 18
  - 5, 10, (do not count 15 since its already been counted in the 3 multiples)
  = 78

--- E
-begin: given an integer
-mid: array to sum up mu.tipels
-end: integer

--- A
- RETURN 0 if target is negative
- CREATE results array
- FIND all multiples of 3 upto target_num and put them in results_array
- FIND all multipels of 5 upto target_num and put them in results_Array
- REMOVE all duplicate integers
- SUM all integers up

=end

def three_and_five(target)
  return 0 if target.abs != target
  multiples = []
  (1..(target-1)).to_a.select { |num| multiples << num if num % 3 == 0 || num % 5 == 0 }
  multiples.uniq.sum
end

p three_and_five(-55) == 0
p three_and_five(10) == 23
p three_and_five(20) == 78
p three_and_five(200) == 9168