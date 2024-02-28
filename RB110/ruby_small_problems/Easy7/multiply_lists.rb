=begin
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each
pair of numbers from the arguments that have the same index. You may assume
that the arguments contain the same number of elements.

Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

---------------------------------------------------------------------------
--- P
- GIVEN: 2 arguments, both arrays of integers
        - both array sizes are equal
        - assume array elements are always integers
- RETURN: ONE ARRAY
          - composed of integers, return array size will be the same size as given arrays
          - each element integer is the product of array1 element * array 2 element
              where the element multiplied starts off at 0 index and increased
              by 1 for each consecutive element
- what happens if array args are empty?

--- E
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
  - both given arrays size == 3
  - return array size == 3
  - return array elements are 27, 50, 77
  - 3 * 9 = 27  arr1[0] * arr2[0]
  - 5 * 10 = 50 ...
  - 7 * 11 = 77 ...
  - 

--- D
beginning: given 2 array arguments
intermediate: maintain array use to isolate each element in both arrays
ending: one array argument

--- A
- FIND the product of arr1 * arr 2 for index 0..-1
  - TRANSFORM one array to the product of itself * arr2 for a given index value
  - map with index
  - start at 0 index upto array size - 1
- RETURN an array of products 


=end

def multiply_list(array1, array2)
  array1.map.with_index { |num, idx| num * array2[idx] }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]