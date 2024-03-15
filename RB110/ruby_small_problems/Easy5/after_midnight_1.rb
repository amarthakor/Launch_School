=begin
The time of day can be represented as the number of minutes before or 
after midnight. If the number of minutes is positive, the time is after 
midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns 
the time of day in 24 hour format (hh:mm). Your method should work with any 
integer input.

You may not use ruby's Date and Time classes.

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

--- P
- GIVEN: positive or negative integer representing the time of day
- RETURN: time of day in 24 hour format in string representation
        - if the given arg is positive
          - the time of day is after midnight
        - if the given arg is negative
          - the time of day is before midnight
        - given argument represents number of minutes
        - return time should be in 24 hour format -> hh:mm
        - should work w/ any integer input
        - cannot use ruby's Date/Time classes

        -1,440 mins in 1 day
        - 60 minutes in 1 hour
        - 24 hours in 1 day
        - 1,440 mins in 24 hours
- assume only pos/neg integer arguments will be passed
--- E
- time_of_day(0) == "00:00"
  - given positive argument 0 - 0 minutes
    - therefore time after midnight is 00:00
      - string representation is "00:00"

- time_of_day(-3) == "23:57"
  - given neg argument -3 - 3 minutes behind midnight
    - therefore time after minight is 23:57 (1,440 minutes - 3minutes = 1,437 minutes)
      - (1,437 minutes) is equal to 23:57 in hh mm format
        - "23:57"

- time_of_day(35) == "00:35"
  - given pos arg 35 -> 35minutes
    - therefore after midnight time is 00:35 -> 35/1440 minutes in a day
      - 60 minutes in an hour therefore 0 hours and 35 minutes have passed

- time_of_day(-1437) == "00:03"
  - given neg arg -1437 -> 1437 minutes before midnight
    - before midnight time is 00:03 as only 3 mins have passed into the current day
      - 1440 - 1437 = 3 minutes -> 00:03 -> "00:03"

- time_of_day(3000) == "02:00"
  - given arg is 3000 minutes -> 24 hours = 1440 mins
    - 2880 mins = 2 days, thus 300 - 2880 = 120mins = 2hours
      - positive arugment so 120mins -> 2 hours  -> 02:00 time
        "02:00"

--- D
beginning: integer
middle: perhaps use hash kv pairs as ratios between different units of time?
ending: string

--- A
- CREATE a variable to refernce the minutes in a day i.e. 1440 minutes
- CONVERT all arguments into positive arguments only
- FIND how many hours have passed for positive numbers
  - total minutes / 60 == hours
    - given integer / 60 == hours if time is more than 60 minutes
      - convert to integer to cut off decimal values
- FIND how many minutes have passed
  - 60 minutes in 1 hour
    - find leftover time from hours
      - multiply leftover time * 60 minutes
        - round to ones place
- COMBINE both numbers into a string
  - use string inerpolation with : as separator
  - use kernal format to format integers
=end

MINUTES_IN_DAY = 1440
MINUTES_IN_HOUR = 60

def time_of_day(time)
  time = time % MINUTES_IN_DAY if time != time.abs && time.abs > MINUTES_IN_DAY
  time = time + MINUTES_IN_DAY if time != time.abs


  time = time % MINUTES_IN_DAY if time > MINUTES_IN_DAY

  hours = time / MINUTES_IN_HOUR.to_f
  final_hours = hours.to_i

  if hours > 1
    minutes = ((hours - final_hours) * MINUTES_IN_HOUR).round(0)
  else
    minutes = (hours * MINUTES_IN_HOUR).to_i
  end

  "#{format('%.2d', final_hours)}:#{format('%.2d', minutes)}"
end

p time_of_day(0) == "00:00" # true
p time_of_day(-3) == "23:57" # true
p time_of_day(35) == "00:35" # true
p time_of_day(-1437) == "00:03" # true
p time_of_day(3000) == "02:00" # true
p time_of_day(800) == "13:20" # true
p time_of_day(-4231) == "01:29" # true