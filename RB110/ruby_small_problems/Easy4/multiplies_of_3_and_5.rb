# Multiples of 3 and 5
# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is 20, the result should be 98
# (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
# 
# P
# Write a method that when given an integer argument, returns the value of
# the sum of all multiples of 3 and 5 up to that integer argument.
# You can assume that the argumenet provided will be greater than 1
# For example, if given 20, the result should return 98
# because (3 + 6 + 9 + 12 + 15 + 18) + (5 + 10 + 20) = 98
#
# input: integer
# output: integer
#
# Explicit + implicit rules
# - Integer arg will be greater than 1
# - Do NOT count repeated values
# - Include the integer provided if it is a factor
#
# E
# 
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168
#
# D
# beginning: none
# intermediate: arrays to store multiples of 3 and 5
# end: array of all multiples of 3/5
#
# A
#
# intitialize total_multiples array to store all multiples needed
# find the multiples for 3 and 5 up to given integer ( helper method )
#   initialize factors array to store all multiples
#   initialize variable 'multiples' and assign to number we want multiples of (3 || 5)
#   loop over multiples where;
#     break out of the loop if multiples is greater than total (given integer)
#     append multiples into factors
#     increment multiples by the number we are trying to find multiples of (3 || 5)
# join the two different arrays
# remove any repeated numbers
# add up all remaining values
# return that total value

def multisum(number)
  total_multiples = []

  total_multiples << find_multiples(3, number)
  total_multiples << find_multiples(5, number)

  total_multiples.flatten.uniq.inject(:+)
end

def find_multiples(num, total)
  factors = []
  multiples = num

  loop do
    break if multiples > total

    factors << multiples
    multiples += num

  end
  factors
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168