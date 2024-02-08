# Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.
#
# P
# Write a method that takes a positive integer argument and returns an array
# of elements, where each element is a single digit of the interger arg provided
#
# input: integer
# output: array
# Explicit Rules
# - inly positive integer will be used
# 
# E 
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true
#
# D
# beginning: integer
# intermediate: array to transform original data value and allow transformation
# ending: array
#
# A
# given an integer argument
# turn it into a string, then split the string into an array where each element
# is a string-number of the original argument
# then, for each element in the array
#   transform the string to an integer data type
#

def digit_list(number)
  number = number.to_s.chars

  number.map { |char| char.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


