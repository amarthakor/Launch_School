=begin

Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle
in degrees, minutes and seconds. You should use a degree symbol (°) to
represent degrees, a single quote (') to represent minutes, and a double
quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

EXAMPLES:

# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Note: your results may differ slightly depending on how you round values,
but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the 
minutes and seconds, e.g., 321°03'07".
You may use this constant to represent the degree symbol:
DEGREE = "\xC2\xB0"


--- P
- Given: An integer or float that represents an angle b/w 0-360
- Return: a string that represents the angle, consisting of three things:
          1) the degree of the angle (1degree = 60mins)
          2) the minutes of the angle (1 minute = 60 seconds)
          3) the seconds of the angle
    Rules: degree should be use ° symbol
           minutes should use ' symbol
           secodns should use " symbol

--- E
dms(30) == %(30°00'00")
  - given integer argument 30
  - degrees = integer argument
  - minutes and seconds both equal 0
  - when integer is given, minutes and seconds are both equal to 00

dms(76.73) == %(76°43'48")
  - given a float (76.73)
  - degrees consist of only integer
  - minutes consist of 43. (1degree = 60mins, so 0.73 * 60 = 43.8, 43rounded down = 43)
  - seconds consist of 48 (1min = 60sec), so ( 0.8 * 60 = 48 )
--- D
beginning: integer or float
intermediate: since mostly using mathamatical equations, dont need to iterate
              over values, will use mixture of numbers and variables and strings
ending: string

--- A
- DEGREE = "\xC2\xB0" to represent degree symbol string representation
- IF number is an INTEGER
  - RETURN an interpolated string of "number, 0, 0" if number is an integer
    - string interpolate... "#{number.to_i}degree 0' 0" "
- IF number is a FLOAT
  - FIND degree value and assign it to degree_value
   - take given number and convert it into integer
     - num.to_i
  - FIND minutes value and assisn it to minutes_value
    - find the decimal remainder * 60 to determine the minutes value
      - (number - number.to_i) * 60
  - FIND seconds value and assign it to seconds_value

- Interpolate string with variables and return value

- CHECK the size of the string.
  - If the size is equal to 1, add a '0' infront of the current value
    - if string.size == 1
      - variable = "0#{variable}"

=end
DEGREE = "\xC2\xB0"

def need_extra_0?(string)
  if string.to_s.size == 1
    string = "0#{string}"
  else
    string
  end
  string
end

def dms(number)
  degrees = number.to_i
  minutes = ((number - degrees) * 60).to_i
  seconds = ((((number - degrees) * 60) - minutes) * 60).to_i

  (degrees = need_extra_0?(degrees))
  (minutes = need_extra_0?(minutes))
  (seconds = need_extra_0?(seconds))
  
  "#{degrees}#{DEGREE}#{minutes}'#{seconds}" + '"'
end

# All test cases should return true
puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")