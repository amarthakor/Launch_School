# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# P
# - Write a method that takes a string and integer and then prints the string
# as many times as the integer specifies
# - input: string and positive integer
# - output: string printed as many times as the integer argument specifies
# 
# E
# - Number has to be positive
# - what happens if we dont enter in a number or string?
# - repeat('hi', 4) => 'hi' 'hi' 'hi' 'hi'
# - repeat('yo', 0) => nothing returned
# - repeat('haha, 1') => haha
#
# D
# - no hash/array will be used
#
# A
# - count from 0 to the integer specified
# - print the string given each time from 0 to the integer specified
#
def repeat(str, num)
  num.times do
    puts str
  end
end

repeat('hi', 3)
repeat('im tired', 2)
repeat('no string', 0)