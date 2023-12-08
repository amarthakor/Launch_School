# Write a method that takes a non empty string argument and returns the middle
# character if the string is odd. If the string is even, return the middle
# character and the character to the left of it.
#
# P
# INPUT: non empty string
# OUTPUT: middle character if odd or middle two characters if even
# - what should we return if the string is whitespace?
# - is there a limit to the string?
# - what happens if a non string argument is passed?
#
# E
# - If string of whitespace is passed, return middle whitespace / whitespaces
# - No limit to strings used, should pass test cases provided
# - Assume only string argument will be used
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'
#
# D
# no DS will be utilized during the solution
# 
# A
# find the length of the string, divide it by 2, and save that value to a variable
# if the string length is even:
#   return the character to the left of the middle + middle character
# otherwise if the string is not even:
#   return the middle character
#
# C

def center_of(message)
  middle = message.length / 2
  if message.length.even?
    message[middle - 1] + message[middle]
  else
    message[middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'