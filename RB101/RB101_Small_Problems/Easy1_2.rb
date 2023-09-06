# write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(-5)
puts is_odd?(4)
puts is_odd?(0)
puts is_odd?(33)
