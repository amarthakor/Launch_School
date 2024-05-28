require 'date'

# 1:43pm

# In this program, we'll construct objects that represent a meetup date. Each object
# takes a month number (1-12) and a year (e.g., 2021). Your object should be able
# to determine the exact date of the meeting in the specified month and year.
# For instance, if you ask for the 2nd Wednesday of May 2021, the object
# should be able to determine that the meetup for that month will occur on
# the 12th of May, 2021.

# The descriptors that may be given are strings: 'first', 'second', 'third',
# 'fourth', 'fifth', 'last', and 'teenth'. The case of the strings is not
# important; that is, 'first' and 'fIrSt' are equivalent. Note that "teenth"
# is a made up word. There was a meetup whose members realised that there
# are exactly 7 days that end in '-teenth'. Therefore, it's guaranteed
# that each day of the week (Monday, Tuesday, ...) will have exactly one
# date that is the "teenth" of that day in every month. That is, every month
# has exactly one "teenth" Monday, one "teenth" Tuesday, etc. The fifth day
# of the month may not happen every month, but some meetup groups like that
# irregularity.

# The days of the week are given by the strings 'Monday', 'Tuesday', 'Wednesday',
# 'Thursday', 'Friday', 'Saturday', and 'Sunday'. Again, the case of the strings
# is not important.

=begin
---- P

Problem: Given two string arguments, return a Date object of the Date
         specified by the arguments

Rules:
- First argument correlates to which day of the week in that month
  - Case does not matter
  - Choices are 'first', second, third, fourth, fifth, teenth CASE dOES NOT MATTER
    - Not all weeks will have a 5th day of the week (ex. maybe only 5th Sun-Tues)
    - 'teenth' represents 13th/14th/15th/16th/17th/18th/19th
      - this day will be a Monday-Sunday

- Second argument represents the day we plan to meetup
  - CASE DOES NOT MATTER
  - Choices are 'monday', 'tuesday'... 'sunday'

- TWO MANDATORY METHODS
  - Constructor method takes 2 arguments
    - BOTH INTEGERS
    - YEAR and MONTH

  - INSTANCE METHOD that takes 2 arugments
    - BOTH STRINGS; CASE DOES NOT MATTER
    - DAY (S-Sat) and OCCURRENCE (first...teenth)
    - SHOULD RETURN DATE OBJECT OF CORRECT DATE

---- E

- check Test suite


---- D
- create array to hold all days in that month of that year?
  - iterate through days and select one that matches our needs?

---- A
- CREATE CONSTRUCTOR METHOD, 2 arguments, year and month
  - @year = year
  - @month = month
  - @day = nil?
  - @days = []
    Date.new(y, m).day.times do |day|
      @days << date objects from 1 to end of month
    end

- CREATE INSTANCE METHOD #day, takes 2 string args, day and occurrence
  -create HELPER methods for each day of the week?
  - if 'monday'.downcase
    - select over @days and return an array of all days that are mondays
    - second helper method
      - if occurrence is 'first', second, third, fourth, or fifth
        - if /else statement
        - select the element at the corresponding idx position
    - third helper method?
      - if occurrence is teenth,
        - select from @days where the day is 13/14/15/16/17/18/19

=end

class Meetup
  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]

  def initialize(yr, mth)
    @year = yr
    @month = mth
    @days = []
    Date.new(yr, mth, -1).day.times { |d| @days << Date.new(yr, mth, d + 1) }
  end

  def day(d, occurrence)
    @days = select_days(d)
    determine_date(occurrence)
  end

  def select_days(day)
    day = day.downcase
    if day == 'monday'
      @days.select(&:monday?)
    elsif day == 'tuesday'
      @days.select(&:tuesday?)
    elsif day == 'wednesday'
      @days.select(&:wednesday?)
    elsif day == 'thursday'
      @days.select(&:thursday?)
    elsif day == 'friday'
      @days.select(&:friday?)
    elsif day == 'saturday'
      @days.select(&:saturday?)
    else
      @days.select(&:sunday?)
    end
  end

  def determine_date(occur)
    occur = occur.downcase
    if occur == 'teenth'
      @days.select { |date| TEENTH_DAYS.include?(date.day) }[0]
    elsif occur == 'first'
      @days.first
    elsif occur == 'second'
      @days[1]
    elsif occur == 'third'
      @days[2]
    elsif occur == 'fourth'
      @days[3]
    elsif occur == 'fifth'
      @days[4]
    else
      @days.last
    end
  end
end

test = Meetup.new(2013, 5)
p test.day('Tuesday', 'first')
