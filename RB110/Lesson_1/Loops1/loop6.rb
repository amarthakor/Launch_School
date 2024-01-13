# Using a while loop, print 5 random numbers between 0 - 99 inclusive.

numbers = []
x = 0

while x < 5
  numbers << rand(0..99)
  x += 1
end

puts numbers