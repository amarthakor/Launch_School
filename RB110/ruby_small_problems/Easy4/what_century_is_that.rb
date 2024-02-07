# Write a method that takes a year as input and returns the century.
# the return value should be a string that begins with the century
# number and ends with 'st', 'nd', 'rd', or 'th' as appropriate for
# that number.
# new centuries begin in years that end with '01'. So, the years 1901-2000
# comprise the 20th century.
#
# P
# write a method that takes a given year and returns the century of that year
# the return value should be a string and have the correct endings for that
# respective number, i.e. 'st', 'nd', 'rd', or 'th'
# input: integer
# output: string
#
# Explicit Rules:
#   - only integers will be passed
#   - return values must be gramatically correct
#       i.e. '20th', '23rd', '22nd', '21st'
#   - must return a string
#   - Centuries end on '00 i.e. 2000 is the 20th century
#   - Centuries begin on '01 ie.e 2001 is the 21st century
#
# D
#
# A
# determine century (primary method)
#   if year % 100 == 0
#     year = year divided by 100
#   else
#     year = (year divided by 100) + 1
# year.to_s
#
# determine correct_ending (helper method)
# utilize case statement
# which years end in 'th' (4th, 5th, 6th, 7th, 8th, 9th, 0th, 11th, 12th, 13th)
# which years end in 'st' (1st, 21st, 31st, etc..)
# which years end in 'nd' (2nd, 22nd, 32nd etc..)
# which years end in 'rd' (3rd, 23rd, 33rd etc..)
#
def century(year)
  if year % 100 == 0
    year = year / 100
  else
    year = (year / 100) + 1
  end
  year.to_s
end

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)

Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number,
 and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 
1901-2000 comprise the 20th century.

=begin
--- P
Create a method that takes a year (integer argument) and returns the century
of that year. The return value (century) should be a string value and end with
'st', 'nd', 'rd', or 'th' as needed (i.e., 21st, 23rd, 31st, 11th 12th). Finally,
a new century begins on years that end in '01', i.e. 2001, 1901, 2201

INPUT: integer
OUTPUT: string

--- E
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th' end in 
century(1127) == '12th'
century(11201) == '113th'

--- D


--- A


--- C


=end