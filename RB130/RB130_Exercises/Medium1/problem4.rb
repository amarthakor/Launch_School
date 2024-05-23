# Ruby gives us a lot of flexibility when assigning arrays to variables.
# If we want to assign the entire array to a single variable, we can do that:
# birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# If we want to assign every element to a separate variable, we can do that too:
# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# Based on the examples shown above, write a method that takes an array as 
# an argument. The method should yield the contents of the array to a block, 
# which should assign your block parameters in such a way that it ignores 
# the first two elements, and groups all remaining elements as a raptors 
# array.

birds = %w(raven finch hawk eagle)

def raptors_only(array)
  yield(array)
end

raptors = raptors_only(birds) { |all_birds| all_birds[-2..-1]}
p raptors