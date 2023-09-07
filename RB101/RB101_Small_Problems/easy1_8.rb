# Write a method that takes a positive integer as an 
# argument and returns that number with its digits reversed.

def reversed_num(num)
  num.to_s.reverse.to_i
end

puts reversed_num(12345) == 54321
puts reversed_num(54321) == 12345
puts reversed_num(1113) == 3111
