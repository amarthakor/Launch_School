=begin
Write a method that combines two Arrays passed in as arguments, and
returns a new Array that contains all elements from both Array arguments,
with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have
the same number of elements.

Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

--- P
- Given: Two arrays, one composed of integers, the other composed of strings
- Want: NEW array composed of elements from both arrays one after the other
- what happens if one or both arrays empty?
--- E
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
  - first argument array goes first
  - new array created by index order

--- D
- beginning: arrays
- interemediate: using array will allow easy iteration and solve problem requirement
- ending: array

--- A
- CREATE results array
- For each element in first array
  - push the current element in the first array into results_array
  - push the current element in the second array into results_array
- RETURN results array

=end

def interleave(array1, array2)
  results_array = []
  array1.each_with_index do |num, idx|
    results_array << num
    results_array << array2[idx]
  end
  results_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']