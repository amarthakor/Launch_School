# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

# P
# Write a method that takes a string and returns the total ASCII value of
# the given string
#
# input: string
# output: integer
#
# Explicit rules
# - we may use the #ord method
#
# Implicit rules
# - only string objects will be provided
#
# E
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0
#
# D
# beginning: string
# intermediate: array to allow for iteration over all index values of string
# ending: integer
#
# A
# given a string value
# initialize total = 0 to represent ascii total
# split given string into individual array elements
# iterate over each element where
#   increment total to by the value of each string-elements ascii value
# return total

def ascii_value(string)
  total_ascii_value = 0
  string = string.split('')

  string.map do |letter|
    total_ascii_value += letter.ord
  end
  total_ascii_value
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0