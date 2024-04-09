=begin
Write a method that rotates an array by moving the first element to the
end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.
6:52pm
Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Problem: Given an array of elements, return a new array

Rules:
- Given array should not be modified
- Return new array
  - New array should consist of same elements as original array
  - New array should rotate first element to end of array
- Cannot use #rotate/rotate!

Algorithm:
- CREATE a new array containing elements fomr the original at 1..-1
- ADD the first element to the end of the newly created array

=end

def rotate_array(array)
  new_array = array[1..-1] << array[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']