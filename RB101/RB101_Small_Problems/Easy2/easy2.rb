# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet
#
# P
# INPUT: 2 floats
# OUTPUT: 2 floats, one representing sq meters, the other representing sq ft
# - Can we assume negative floats will not be used?
# - What happens if non integers/floats are entered?
#
# E
# - Assume only positive numbers will be entered by user
# - Do not need to worry about number validity
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
#
# D
# no data structures will be used
#
# A
# get the length and width from the user in meters
#     - can use sub feature to obtain these values
# find sq meters by calculating l x w
#     - can use sub process to obtain this value
# convert l & w in meters to feet, 1m = 10.7639ft, find sq ft by calc l x w
#     - can use sub process for this value. 
# output both values
#
# C
METERS_TO_FT = 10.7639

def get_length
  puts 'What is the length of your room in meters?'
  length = gets.chomp.to_f
end

def get_width
  puts "What is the width of your room in meters?"
  width = gets.chomp.to_f
end

def calc_area_feet(length, width)
  area = length * width
  area * METERS_TO_FT
end

def calc_area_meters(length, width)
  length * width
end

length = get_length
width = get_width

area_meters = calc_area_meters(length, width).round(2)
area_feet = calc_area_feet(length, width).round(2)

puts "The area of the room is #{area_meters} sq meters (#{area_feet} sq feet)"