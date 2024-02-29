=begin
Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 
comprise the 20th century.

Examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

--- P
- GIVEN: year represented as integer
- RETURN: string representing the century of given year
        - century should have correct suffix of 
          'st', 'nd', 'rd', or 'th', as necessary
- new century begins in year 01, not on 00
--- E
2000 == '20th' century
1052 == '11'th century
2001 == '21st' century

centuries that end in 11, 12, 13 end in 'th'
centuries that end in 1 end in 'st'
centuries that end in 2 end in 'nd'
centuries that end in 3 end in '3rd'
centuries that end in 4, 5, 6, 7, 8, 9, 0, end in 'th'

--- D
- beginning: integer
intermediate: hash to represent kv pairs between years and suffixes
ending: string

--- A
- CALCULATE the correct century for a given integer year
  - centuries are 100years... 
  - if a year is even divisble by 100
    - year / 100
  - if a year is not evenly divisble by 100
    - year / 100 + 1
- ADD the correct suffix to century
  - employ conditional to see if century ends in 11, 12, 13
  - if it doesnt, use hash to determine suffix by appending appropriate ending if last digit matches key
=end

CENTURY_SUFFIX = { '0' => 'th', '1' => 'st', '2' => 'nd', '3' => 'rd', '4' => 'th', '5' => 'th',
                   '6' => 'th', '7' => 'th', '8' => 'th', '9' => 'th'}

def century(year)
  century = year % 100 == 0 ? year / 100 : year / 100 + 1
  century = century.to_s
  
  return century + 'th' if ['11', '12', '13'].include?(century[-2..-1])
  CENTURY_SUFFIX.each do |k, v|
    if century[-1] == k
      century += v
    end
  end
  century
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'