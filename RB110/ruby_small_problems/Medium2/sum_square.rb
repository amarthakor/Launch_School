=begin
Write a method that computes the difference between the square of 
the sum of the first n positive integers and the sum of the squares 
of the first n positive integers.

Examples:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

--- P
given: inter
return: integer
        - find the difference between
        - the square of the sum of the first n positive integers
          - add up all nums then square it
        - subtracted by
        - the sum of the squares of the first n positive integers
          - square all nums then sum them

- if num is 1 return 0
--- E


--- D
beginning: integer
midd;e: array to sum square and square sum
end: integer

--- A
- convert the integer into an array of digits from 1 to n
- FIND the square of all the nums added 
- FIND the squares of each num upto n and then sum them all
- SUBTRACT the first found num from the second found num
- RETURN that difference

=end

def sum_square_difference(number)
  arr_of_nums = (1..number).to_a
  (arr_of_nums.sum * arr_of_nums.sum) - (arr_of_nums.map { |num| num * num }.sum)
end

p sum_square_difference(3) #== 22
    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150