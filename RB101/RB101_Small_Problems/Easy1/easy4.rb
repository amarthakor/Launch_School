# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0

# P
# - Write a program that takes two values, a postive number and a boolean(true/false)
# - and determines the bonus for a given salary. If the bool is true, the bonus
# - will be half of the salary. If the boolean is false, the bonus will be 0
#
# - INPUT: postive integer, boolean value
# - OUTPUT: integer value representing bonus
#
# - What happens if the integer is 0 or negative?
# - What happens if a value other than an integer is entered?
# - What happens if a boolean is not entered?
# - What happens if a odd number is enetered as the salary?
#
# E 
# - puts calculate_bonus(2800, true) == 1400
# - puts calculate_bonus(1000, false) == 0
# - puts calculate_bonus(50000, true) == 25000
# - if 0 is entered, continue the calculation as normal
# - no need to handle negative integers
# - no need to handle values that are not booleans
# - bc integer / operations return ints, a float can be used to determine
#       accurate bonus values
# D
# - no data structures will be used
#
# A
# - if the boolean `false` is passed, return 0
# - otherwise return the salary divided by 2.0
#
# C
def calculate_bonus(salary, boolean)
  return 0 if boolean == false
  salary / 2.0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000