# Write a method called drop_while that behaves similarly for Arrays. It should take an Array as 
# an argument, and a block. It should return all the elements of the Array, except those elements
#  at the beginning of the Array that produce a truthy value when passed to the block.

# If the Array is empty, or if the block returns a truthy value for every element, 
# drop_while should return an empty Array.


# Examples:

def drop_while(arr)
  new_arr = []

  arr.each { |ele| new_arr << ele if !yield(ele) || new_arr.size > 0 }
  
  new_arr
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []