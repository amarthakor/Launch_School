# The Array#zip method takes two arrays, and combines them into a single array 
# in which each element is a two-element array where the first element is a 
#   value from one array, and the second element is a value from the second 
#   array, in order. For example:

# Copy Code
# [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
# Write your own version of zip that does the same type of operation. It should 
# take two Arrays as arguments, and return a new Array (the original Arrays 
# should not be changed). Do not use the built-in Array#zip method. You may 
# assume that both input arrays have the same number of elements.

=begin
---- P
Problem: Given two arrays of equal length, return a new array containing nested arrays

- don't mutate argument arrays
- cannot use #zip
- New nested array should contain an inner array composed of 2 integers
- new return array size will match the size of the arguments given
- index position of given arrays element will match index position within return nested array

---- A
- CREATE a new return array
- ITERATE over given array1
  - for each index
    - append the current index elements from both arrays into the new return array
- RETURN the new return array

=end

def zip(arr1, arr2)
  new_arr = []

  arr1.each_index { |idx| new_arr << [arr1[idx], arr2[idx]]}

  new_arr
end

# Example:
p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]