=begin
Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.

Examples
[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

--- P
- given: array of integers
- return: integer element that appears an odd number of times

- assume array will always have at least 1 element
- return the only element if array size == 1
- how to handle arrays with multiple elements w/ odd appearances?
  - assume that only one element appears an odd number of times
--- E
- [7] -> 7 because 7 appears 1x in the array, which is odd
- [1, 1, 2] -> 2 ,because 2 appears 1x in the array which is odd

- [0, 1, 0, 1, 0] -> 0, because it appears 3x, which is odd
--- D
- array of ints
- maintain array to find counts of each element
- integer

--- A
- ITERATE over the array
  - for each element,
    - select it if the amount of times it appears in the colleciton is odd


=end

def find_odd_int(arr)
  arr.select { |num| arr.count(num).odd? }.first
end

p find_odd_int([7]) == 7
p find_odd_int([0]) == 0
p find_odd_int([1,1,2]) == 2
p find_odd_int([0,1,0,1,0]) == 0
p find_odd_int([1,2,2,3,3,3,4,3,3,3,2,2,1]) == 4