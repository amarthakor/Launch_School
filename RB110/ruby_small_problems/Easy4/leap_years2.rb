# Under the Julian calendar, a year is a leap year if it is
# evely divisble by 4
# Under the Gregorian calendar, which started in 1752, a year is a leap year
# if it is evenly divisble by 4. If it is ALSO evenly divisibly by 100, (i.e 2100)
# then it is only a leap year if it is evenly divisbly by 400
# Create a method that determines if a year is a leap year before
# and after 1752
#
# P
# Given a year, check to see if the year is a leap year or not following the
# standards of the two different calendars, Julian before 1752, Gregorian after 1752
# Input: integer
# Output: boolean
#
# Explicit Rules:
# - Year must be evenly divisble by 4
# - Year will be greater than 0
# - Only integers, no other values, will be provided
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
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true
#
# D
#
# A
# 

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  elsif year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# test cases should all return true
puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
