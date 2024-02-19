=begin
Write a method that takes an Array, and returns a new Array with the 
elements of the original list in reverse order. Do not modify the 
original list.

You may not use #reverse or #reverse!

--- P
 - Given: Array of elements
 - Want: New array of elements in reverse order
 Rules:
 - I need to reverse the order of my elements in return array
 - It has to be a new return array, so I cannot mutate the original argument
 - If empty array is given, return an empty array
 - If given array only has 1 element, return a new array of the same array


--- E
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == [] 




--- D
beginning: given array argument
intermediate: array would allow manipulation of each element independently
ending: return value has to be array



--- A
- RETURN empty array if given array is empty
  - return [] if array.empty?
- CREATE array to hold results
  - initialize variable to hold results array
    - flipped_array = []
- PUSH all elements, starting at the last index, into the results array
  - intialize counter to -1
  - starting at index value -1, push each element into results array
  - decrement index value by -1
- RETURN results array

=end

def reverse(array)
  flipped_array = []
  last_index = -1

  array.each_index do |_|
    flipped_array << array[last_index]
    last_index -= 1
  end
  flipped_array
end

def reverse2(array)
  last_index = -1
  results = array.each_with_object([]) do |num, obj|
    obj << array[last_index]
    last_index -=1
  end
  results
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == [] 


puts reverse2([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse2(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse2(['abc']) == ['abc']              # => true
puts reverse2([]) == [] 
