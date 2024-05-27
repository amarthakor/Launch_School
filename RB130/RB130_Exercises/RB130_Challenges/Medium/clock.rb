# Create a clock that is independent of date.
# 2:25pm
# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate
# Clock objects when adding and subtracting minutes -- create a new
# Clock object.

# Two clock objects that represent the same time should be equal to
# each other.

# You may not use any built-in date or time functionality; just use
# arithmetic operations.

# ---- P
# Problem: Given 1-2 integer arguments, return a string that represents the time in 'hh:mm'

# Rules:
# - The first argument represents the hours
# - The second argument represents the minutes
# - Should be able to add or subtract to change the time
#   - Probably need to create + and - methods for the class
# - One class method, #at(hour, minutes) -> minutes is optional
# - Different class objects should be equal for value, thus
#   - need custom #== that compares the return string for both class objects
# - When subtracting or adding time, after a full day has passed, go back to 00:00
#   - thus 23:59 is the highest, 00:00 is the same as 24:00
# - Class method #at, but when we add or subtract well probably need isntance methods
# --- E
#  - check test suite

# --- D
# - probably wont use any DS as operations will be handled by arithmetic

# --- A
# 

class Clock
  def initialize(hr, min=0)
    @hour = hr
    @minutes = min
  end

  def self.at(hr, min=0)
    new(hour, minute)
  end

  def ==(other_clock)

  end

  def +(more_time)

  end

  def -(less_time)
 
  end

  def to_s
   
  end
end


