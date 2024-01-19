# In the array
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# Find the index of the first name that starts with "Be"

# P
# In the given array, identify the index value of the element that starts with "Be"
# input: array
# output: integer
#
# E
#
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# => 3 (index 3 correlates with element "Betty", which starts with "Be")
#
# D
#
# A
# for each name,
  # compare the name to see if the first 2 letters == "Be"
  # if it does, pick the index value of said name

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |name| name[0, 2] == "Be"}
