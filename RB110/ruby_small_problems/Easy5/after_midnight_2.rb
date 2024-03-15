=begin
As seen in the previous exercise, the time of day can be represented as the 
number of minutes before or after midnight. If the number of minutes is 
positive, the time is after midnight. If the number of minutes is negative, 
the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return 
the number of minutes before and after midnight, respectively. Both methods 
should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

--- P
- given: string representing the time of a 24hour clock format
- return: an integer;
        - two methods, the first method after_midnight
          - takes the time and returns how many minutes have passed since midnight
        - the second method, before_midnight
          - takes the time and returns how many minutes until midnight

        - both methods should return an integer from 0..1439
          - that is 1440 total minutes
        24:00 which is a full day or 00:00 is also equal to 0
--- E
- after_midnight(00:00) = 0
  - no time has passed after midnight thus we return 0
- before_midnight(00:00) == 0
  - no time is left until midnight, it is currently midnight, thus we return 0

- after_midnight(12:34) == 754
  - it is currently 754 mins after midnight
    - 12 hours * 60 mins = 720 minutes
      - also 34 munutes into current hour
        - 720 + 34 == 754 minutes

- before_midnight(12:34) == 686
  - 686 minutes left until it is midnight (00:00)
    - total time in 1 day is 1440 minutes
      - it is currently 754 minutes into the current day
      - 1440 - 754 minutes = 686 minutrs left untul midnight

- before_midnight (24:00) == 0
- afterminidnugt_ (24:00) == 0
  - for both of these, 24:00 is the time in one full day
    - one full day has elapsed, which is the same as 00:00
    - therefore since we are restarting the timer, 
      - return 0

--- D
beginning: string
middle: none
end: integer

--- A
for before_midnight
- RETURN 0 if given string is '24:00' or "00:00"
- FIND out how much time has elapsed in the current day - hours
  - slice the first two chars from the string and convert that number into an integer
    - multiply the integer hour by 60 minutes
- FIND out how much time has elapsed in the current day - minutes
  - slice the last two chars from the string and convert that number into an integer
- SUM the total time passed in hours and minutes
- CALCULATE the difference between time in day and total elapsed time
- RETURN that difference

=end
MINUTES_IN_DAY = 1440

def before_midnight(time)
  return 0 if (time == "24:00") || (time == "00:00")
  
  minutes_in_hours = time[0, 2].to_i * 60
  leftover_minutes = time[3, 2].to_i

  time_elapsed = minutes_in_hours + leftover_minutes
  MINUTES_IN_DAY - time_elapsed
end

def after_midnight(time)
  return 0 if time == '24:00' || time == "00:00"

  minutes_in_hours = time[0, 2].to_i * 60
  leftover_minutes = time[3, 2].to_i

  minutes_in_hours + leftover_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0