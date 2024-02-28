=begin
Write a method that takes two Array arguments in which each Array contains a list
of numbers, and returns a new Array that contains the product of every pair of
numbers that can be formed between the elements of the two Arrays. The results
should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

------------------------------------------------------------------------
---- P
- GIVEN: two array arguments, both composed of integers
        - array size may or may not be equal
- RETURN: SINGLE array
        - composed of integers
        - integers are product of all pairs of elements between given arrays
        - final array should be sorted from least to greatest
- assume given arrays will never be empty
- assume given arrays will always contain integer objects
---- E
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
- final array is composed of products of element pairs from given array elements
 - 2x4, 2x3, 2x1, 2x2 == 8, 6, 2, 4
 - 4x4, 4x3, 4x1, 4x2 == 16, 12, 4, 8
 -> [2, 4, 4, 6, 8, 8, 12, 16]


---- D
begining: 2 arrays of integers
intermediate: maintain array to iterate over both array arguments
ending: single array

---- A
- TRANSFORM the current array 
  - for each element in array1 #map
    - multiply the current element by all elements in arr2
- SORT the returned array from least to greatest
  -#sort

=end

def multiply_all_pairs(arr1, arr2)
  arr1.map do |num|
    arr2.map do |num2|
      num * num2
    end
  end.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
