# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# # Fill out the following method calls for gather so that they produce 
# # the corresponding output shown in numbers 1-4 listed below:

# 1)


gather(items) do |*first, last|
  puts "#{first.join(', ')}"
  puts "#{last}"
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
# 2)

puts

gather(items) do |first, *middle, last|
  puts "#{first}"
  puts "#{middle.join(', ')}"
  puts "#{last}"
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
# 3)

puts

gather(items) do |first, *last|
  puts "#{first}"
  puts "#{last.join(', ')}"
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
# 4)

puts

gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!