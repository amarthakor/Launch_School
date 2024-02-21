=begin

Write a method that takes two Arrays as arguments, and returns an Array
that contains all of the values from the argument Arrays. There should
be no duplication of values in the returned Array, even if there are 
duplicates in the original Arrays.

Example:
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


--- P
 -Given: two arrays as arguments
 -Goal: one array composed of both given arrays
        - No duplicate values allowed in the final array

--- E
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
 - [1, 3, 5] + [3, 6, 9] = [1, 3, 3, 5, 6, 9] => [1, 3, 5, 6, 9]

--- D
- beginning: given array arguments
-intermediate: some method or modification to combine multiple arrays
- ending: problem requirement needs array return value


--- A
- CREATE an array composed of the two given arrays
  - add two arrays together?
  - OR
  - initialize new var to hold both arrays?
- REMOVE all duplicate values in the single
  - uniq?
- RETURN the final array

=end

def merge(array1, array2)
  (array1 + array2).uniq
  # single_array = array1 + array2
  # single_array.uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]