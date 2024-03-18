require 'date'

=begin
Write a method that returns the number of Friday the 13ths in the year 
given by an argument. You may assume that the year is greater than 
1752 (when the United Kingdom adopted the modern Gregorian Calendar) 
and that it will remain in use for the foreseeable future.

Examples:
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2


--- P
- given: year
- return: integer representing the amount of Friday the 13s in that year
        - year will be greater than 1752 when Gregorian Calendar was implemented
        - integer represents the year 
--- E
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

--- D
beginning: integer
mid: array to iterate over months
end: integer

--- A
- CREATE a friday the 13th counter variable and SET to 0
- ITERATE over an array of 12 months [1..12]
  - for each month
    - if the given year, current month, and 13th day is a friday
      - increment friday_13th var by += 1
- RETURN the value of fri13th

=end
MONTHS_IN_YEAR = (1..12).to_a

def friday_13th(year)
  friday_13ths = 0

  MONTHS_IN_YEAR.each do |month|
    friday_13ths += 1 if Date.new(year, month, 13).friday?
  end

  friday_13ths
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2