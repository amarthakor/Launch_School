# In the Gregorian Calendar, leap years are evenly divisible by 4 and 400
# 
# Write a method that takes any year greater than 0, and returns true if the
# year is a leap year, or false if it is not a leap year
#
# P
# Write a method that takes an integer (year) greater than 0, and returns either
# true or false if that integer(year) is a leap year or not
# In order to be a leap year, the year must be evenly divisible by both 4 and 400
# input: integer
# output: boolean
#
# Explicit rules
# - Integer must be divisible by both 4 and 400 to be a leap year
# - If evenly divisible by 100, but not 400, is not a leap year
# - All input will be integers > 0
#
#
# E
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true
#
# D
#
# A
# if the year is odd?
#   return false
# if the year is evenly divisble by 100?
    # check to see if the year is evenly divisble by both 4 AND 400
# else
  # check to see if the year is evenly divisble by 4
#
def leap_year?(year)
  if year.odd?
    false
  elsif year % 100 == 0
    (year % 400 == 0) && (year % 4 == 0)
  else
    (year % 4 == 0)
  end
end

puts leap_year?(2016) #== true
puts leap_year?(2015) #== false
puts leap_year?(2100) #== false
puts leap_year?(2400) #== true
puts leap_year?(240000) #== true
puts leap_year?(240001) #== false
puts leap_year?(2000) #== true
puts leap_year?(1900) #== false
puts leap_year?(1752) #== true
puts leap_year?(1700) #== false
puts leap_year?(1) #== false
puts leap_year?(100) #== false
puts leap_year?(400) #== true
