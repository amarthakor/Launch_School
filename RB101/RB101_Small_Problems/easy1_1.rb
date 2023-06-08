# write a method that takes two arguments, a string and a positive
# integer, and prints the string as many times as the integer indicates.

def repeat(string, integer)
  integer.times do
    puts string
  end
end

repeat('hi', 4)
repeat('what time is it?', 2)
