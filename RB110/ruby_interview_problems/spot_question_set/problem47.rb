=begin
Your goal in this kata is to implement a difference function,
which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b.
array_diff([1,2],[1]) == [2]

If a value is present in b, all of its occurrences must be removed from the other:
array_diff([1,2],[1]) == [2]

Problem: Given two arrays, return a new array

Rules:
- Return array should be comprised of differences between A and B array
- Given the first array and second array
  - return a new array where
  - the values from the first array are removed that are specified by 
    the second array

Examples:
- [1, 2] , [2] => [1]
  - since 2 is the common factor, we return [1]

Algorithm:
- SUBTRACT the values of array 2 from array 1
- RETURN this difference

=end

def array_diff(arr1, arr2)
  arr1 - arr2
end


p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []