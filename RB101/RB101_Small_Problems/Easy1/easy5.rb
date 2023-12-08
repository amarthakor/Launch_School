# Write a method that will take a short line of text and print it w/n a box
#
# P
# INPUT: string
# OUTPUT: given string inside a box
# What happens if a non-string is passed?
# What is the character limit for our string?
# What happens if the string provided is over the string limit?
#
# E
# The character limit is 80 characters
# Do not need to worry about strings over 80 characters at this time
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
#
# D
# no data structures will be used
#
# A
# create top line by printing right edge + top of box * the string length + left edge
# create left side of box with just | then right side of box with |
# repeat side of box with |, print message in middle, then close side of box |
# repeat steps from line 31
# repeat steps from line 30 to finish bottom of box
#
# C

def print_in_box(string)
  puts "+-" + "-" * string.length + "-+"
  puts "| " + " " * string.length + " |"
  puts "| " + string + " |"
  puts "| " + " " * string.length + " |"
  puts "+-" + "-" * string.length + "-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box(' ')