# Write a program that randomly generates and prints Teddy's age. The age should
# be from 20 - 200.
#
# P
# INPUT: none
# OUTPUT: string with teddy's age
# - Does the age range include 20 and 200, or only numbers in between?
#
# E
# - The age range should include the outer limits, 20 and 200
# - Example output: Teddy is 69 years old!
#
# D
# an array will be used to store the age range from 20 - 200
#
# A
# create a range between 20 and 200, that includes the outer limits 20/200
# convert this range to an array
# generate a randomy number from this array of integers 20-200
# output string "Teddy is #{age} years old!"
#
# C
# 
age = (20..200).to_a

puts "Teddy is #{age.sample} years old!"
puts "Teddy is #{age.sample} years old!"
puts "Teddy is #{age.sample} years old!"