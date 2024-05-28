# Create a clock that is independent of date.
# 11:20am
# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate
# Clock objects when adding and subtracting minutes -- create a new
# Clock object.

# Two clock objects that represent the same time should be equal to
# each other.

# You may not use any built-in date or time functionality; just use
# arithmetic operations.

# ---- P
# Problem: Given 1-2 integer arugments, create a clock(object) of the time

# Rules:
# # - Should be able to add or subtract minutes from the time of the clock
#   - Should not mutate clock objects when adding/subtracting, rather create a NEW clock object
#   - Two different clock objects that represent the same time should be == to each other
#   - Cannot use built in time or date functionality; only arithmetic operations
#   - 24 hour clock time
#   - Format string such that single hours and digits are preceded by a 0
#     - '00:00' format of 'hh:mm'
#   - Added/subtract time are in minutes

#   - METHODS REQUIRED
#   - Clock class
#   - 1. class method #at
#     - should return a clock object when invoked
#   - 2. Constructor method to create a clock object
#   - 3. to_s instance method, formats return in 'xx:xx' format
#   - 4. + instance method for adding more time
#     - returns new clock object updated time
#   - 5. '-' instnace method for subtracting less time
#     - returns new clock object with updaed time
#   - 6. custom == method for comparing two clock objects...
#     - should be equal if time is equal

# --- E
#
# Check test suite for examples

# --- D
#
# none

# --- A
# - CREATE constructor method
    # - 
  # - CREATE class method #at(X, X)
  #   - takes 2 arguments, second is optional
  # - CREATE instance method '+' takes integer argument
  #   - returns NEW clock object
  # - CREATE instance method '-' that takes integer argument
  #   - returns NEW clock object
      # - Going backwards in time so must count backwards, not add time
      # - While total time is negative
      #   - need to add 24 hrs until no longer negative
          # - then find new_hr using total_minutes
          #   - total_mins / hr
          # - find new_min using total minutes
          #   - total_mins - new_hr*60 to find any leftover minutes
  # - CREATE to_s instance method
  #   - formats time into 'hh:mm' string
      # - 
  # - CREATE == instance method
  #   - when two clock objects are equal time, should be equal

class Clock
  MINS_IN_DAY = 60 * 24

  attr_reader :hour, :min, :total_minutes

  def initialize(hr, min=0)
    @hour = hr
    @min = min
    @total_minutes = (hr * 60) + (min)
  end

  def self.at(hr, min=0)
    new(hr, min)
  end

  def ==(other_clock)
    hour == other_clock.hour && min == other_clock.min
  end

  def +(more_time)
    total_time = total_minutes + more_time

    while total_time > MINS_IN_DAY
      total_time -= MINS_IN_DAY
    end

    new_hr = total_time / 60
    new_min = total_time - (new_hr * 60)

    Clock.at(new_hr, new_min)
  end

  def -(less_time)
    total_time = total_minutes - less_time

    while total_time < 0
      total_time += MINS_IN_DAY
    end

    new_hr = total_time / 60
    new_min = total_time - (new_hr * 60)

    Clock.at(new_hr, new_min)
  end

  def to_s
    format('%02d:%02d', hour, min)
  end
end

# test = Clock.at(0, 30) - 60
# test2 = Clock.at(5, 31)
# puts test