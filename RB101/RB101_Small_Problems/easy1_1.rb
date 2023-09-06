# write a method that takes two arguments, a string and a positive
# integer, and prints the string as many times as the integer indicates.

def repeat(str, num)
  num.times do
    puts str
  end
end

repeat('FSU destroyed LSU in their season opener', 5)
repeat("I'm hungry", 3)
