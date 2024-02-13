=begin

Given an array of n positive integers and a positive integer, find the minimal
length of a contiguous subarray for which the sum >= integer.

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0



--- P
  - Given: 2 arguments
          1) array of positive integers
          2) positive integer
  - Want: Minial length of a subarray where the sum of the subarray integers is >= the integer
        - We want least amount of integers
        - we want the sum of integers to be >= given integer

--- E
p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
  - 2 + 2 + 1 + 3 >= 7, however we used 4 integers
  - 4 + 3 >= 7, we only used 2 integers, so this is the minial subarray required

--- D
beginning: input is given in array format
intermediate: create array of subarrys that are >= integer, then select smallest array?
end: subarray of minimal elements, count all elements in array?

--- A
- CREATE array of combos
  - comobinations = []
- FIND subarrays of all possible integer combinations
    - for each integer, determine start index and end index
      - 0.upto(#size - 1) to determine start index
        - nested loop and redo 0.upto(#size - 1) to determine end index
        - use array slicing to push all possible combos to combinations array
        - combinations << given_array[start_idx..end_idx]
- SELECT those combos that are >= 7
    - #select array.sum >= target?
- TRANSFORM the subarrays to their respective length/size/count
  - for each subarray, find the size of the subarray
    - #map, #size/#length#/count? to transform integers into size of subarray
- SELECT the smallest length/size/count
  - #min?
- RETURN the smallest value


=end

def minSubLength(array, target)
  return 0 if array.sum < target
  possible_combos = []
  
  0.upto(array.size - 1) do |start_idx|
    start_idx.upto(array.size - 1) do |end_idx|
      possible_combos << array[start_idx..end_idx]
    end
  end

  valid_combos = possible_combos.select { |numbers| numbers.sum >= target }
  valid_combos.map { |numbers| numbers.size}.min
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0