# write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute
# value is odd. You may assume that the argument is a valid integer value.

def odd_number?(num)
  num % 2 == 1
end

puts odd_number?(5)
puts odd_number?(6)
puts odd_number?(0)
puts odd_number?(-15)
