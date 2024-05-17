# The Range#step method lets you iterate over a range of values where each value 
# in the iteration is the previous value plus a "step" value. It returns the 
# original range.

# Write a method that does the same thing as Range#step, but does not operate 
# on a range. Instead, your method should take 3 arguments: the starting value, 
# the ending value, and the step value to be applied to each iteration. Your 
# method should also take a block to which it will yield (or call) successive 
# iteration values.

# Example:
def step(start_num, end_num, stepper)
  current_value = start_num
  
  while current_value <= end_num
    yield(current_value)
    current_value += stepper
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10

# What do you think would be a good return value for this method, and why?
=begin
---- P
Problem: Given 3 itneger values, return a string

- first integer is starting value
- second integer is ending value
- third integer is step value
  - in this case, step is an incrementer 
- cannot use a range structure
---- E

step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10

- start at 1, end at 10, step by 3 or increment by 3
  - 1
  - 1+3 -> 4
  - 4 + 3 -> 7
  - 7 + 3 -> 10
  - stops becuase we have reached ending value

---- A
- CREATE a current_value and set to first argument
- LOOP over starting_value
  - while current_val is less than or equal to ending value
  - yield to block argument and pass in current_value
  - increment current_value by + 3
  - break when current_value is greater than ending_value
- return nil
=end
