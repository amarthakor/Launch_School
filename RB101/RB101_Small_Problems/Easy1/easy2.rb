# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

# P
# - Write a method that takes an integer argument and return true if 
# - this integers aboslute value is odd. If the integer is even, return false.
# - INPUT: valid integer value (negative, zero, positive)
# - OUTPUT: Return true if absolute value is odd or false if abs val is even
#
# E
# - We are NOT allowed to use the methods #odd? or #even? in our solution
# - We can assume the argument will be a valid integer argument
# - How is 0 defined in terms of even or odd? => 0 is even and 
#                                                therefore will return false
# - puts is_odd?(2)    # => false
# - puts is_odd?(5)    # => true
# - puts is_odd?(-17)  # => true
# - puts is_odd?(-8)   # => false
# - puts is_odd?(0)    # => false
# - puts is_odd?(7)    # => true
#
# D
# - No data structures will be used
#
# A
# - find absolute value of integer
# - obtain remainder of integer % 2 to see if integer is even or odd
# - if remainder value is 1 return true
# - if remainder value is 0 return false


def is_odd?(num)
  num.abs
  num % 2 == 1 ? true : false
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true