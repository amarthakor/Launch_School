# write a method that takes one argument, a positive integer, and
# returns a string of alternating 1s and 0s, always starting with
# 1. The length of the string should match the given integer.
#
# P
# - Write a method that takes a positive integer as an argument
#   and returns a string of alternating 1s and 0s, always beginning
#   with 1. The length of the alternating strings should match the
#   provided integer.
# - Does 0  count as a positive integer?
# - What happens if a negative integer is provided?
# - What happens if a non integer argument is provided?
# - INPUT: integer
# - OUTPUT: string of alternating 1s and 0s, starting with 1
#
# E
# - We can assume no negative ints will be used
# - We can assume no non integer argument will be used
# - 0 is positive, in which case there will be no output
# - puts stringy(6) == '101010'
# - puts stringy(9) == '101010101'
# - puts stringy(4) == '1010'
# - puts stringy(7) == '1010101'
#
# D
# - no data structure will be used
#
# A
#
# intialize variable stringyy to empty string;
# iterate integer times where
# if int is even
#   push '1' in stringyy
# if int is odd
#   push '0' in stringyy
# end iteration once we reach integer value
# puts stringgy

def stringy(num)
  stringyy = ''
  num.times do |int|
    if int.even?
      stringyy << '1'
    else int.odd?
      stringyy << '0'
    end
  end
  stringyy
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
