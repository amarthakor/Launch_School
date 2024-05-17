# Write a method called count that behaves similarly for an arbitrarily long 
# list of arguments. It should take 0 or more arguments and a block, and then 
# return the total number of arguments for which the block returns true.

# If the argument list is empty, count should return 0.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, 
# for, while, or until to iterate through the Array passed in as an argument, 
# but must not use any other methods that iterate through an Array or any 
# other collection.

# Examples:

def count(*args)
  counter = 0
  args.each { |ele| counter += 1 if yield(ele) }
  counter
end

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3