# What happens when we modify an array while we are iterating over it?
# What would be the output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# If we modify an array while we are iterating over it, we end up mutating the
# original array object in real time, possibly affecting every new iteration
# The output of this code would be:
1
3
=> [3, 4]
# this occurs because we first print the first element (1)
# then we shift (deletes specified element) the first element [1]
# now the array mutates from [1, 2, 3, 4] to [2, 3, 4]
# since each has already iterated over the 'first' index element,
# it goes to the next element, at the 1 index, which is in our new
# mutated array, the element [3].
# we then print 3, and shift the first element again [2]
# now the array mutates again from [2, 3, 4] to [3, 4]
# now each moves onto the 3rd element, however, our array has been
# mutated and now only contains 2 elements, so iteration stops.

# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# we would output 
1
2
[1, 2]
# this is similar to the last example except here we print the first element
# in our array, [1]. Next, we destructively remove the last element [4]
# we then move to our next iteration, the 2nd element [2]
# we print 2 to the display and then remove the last element [3]
# since we have mutated our array on both iterations, we now only contain
# 2 array elements, and therefore have completed iteration of all
# possible elements.