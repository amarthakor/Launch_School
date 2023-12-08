# Write a program that takes a positive integer, n, as an argument and displays
# a right triangle whose sides each have `n` stars. The hypotenuse of the triangle
# should have one end at the bottom left of the triangle, with the point
# of the triangle being at the top right.

# P
# INPUT: integer
# OUTPUT: star right triangle
# - Is there a limit to the `n`?
# - What occurs if an integer is not passed?
# 
# E
# For our purposes, we do not have to worry about a limit to `n`
# Only integers will be passed
# triangle(5)      triangle(9)

#     *                       *
#    **                      **
#   ***                     ***
#  ****                    ****
# *****                   *****
#                        ******
#                       *******
#                      ********
#                     *********
#
# D
# no data structures will be used
#
# A
# - have spaces equal to `n` - 1 to represent spaces required, then for each
#   consecutive line, increment the spaces by -1 until the var == 0
# - print stars after whitepsace has been input, starting at 1 and
#   incrementing by +1 until stars == `n + 1`
#
# C
#
def triangle(num) 
  spaces = num - 1
  stars = num - spaces
  loop do
    puts " " * spaces + "*" * stars
    spaces -= 1
    stars += 1
    break if stars == num + 1
  end
end

triangle(5)
triangle(9)