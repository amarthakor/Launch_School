=begin
You've just discovered a square (NxN) field and you notice a warning sign. 
The sign states that there's a single bomb in
the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and 
returns the location of the mine. The mine is
represented as the integer 1 in the 2D array. Areas in the 2D array that 
are not the mine will be represented as 0s.
The location returned should be an array (Tuple<int, int> in C#) where 
the first element is the row index, and the second
element is the column index of the bomb location (both should be 0 based). 
All 2D arrays passed into your function will
be square (NxN), and there will only be one mine in the array.

Problem: Given an array of subarrays filled with 1 or 0s, return an
          array of integers

Rules:
- Return array will be two integers, coordinates that are the location of a bomb
- Bomb is represented as integer 1 w/n the given array
- 0's represent no bombs iwithinn the given array
- Return array first element is the row index and the second element is the
    column index of the bomb
    - indexes should be 0 based
- ALL 2D arrays will function as a square, x*y
- Only be one mine in the array

- ENTIRE subarray represents the row
- individual elements within the subarray represents the column
- when a '1' is encountered, need to track which subarray index im on
  - and track which index im on within the current subarray

Algorithm:
- CREATE outterindex, innerindex set them both to 0
- ITERATE over the entire array
  - track index w/ 
    - ITERATE over the subarr
      - if the current num in the subarr is a 1
        - set innerindex to the current index
        - set outterindex to the current index of the subarr 

- RETURN an array of the two vars
=end

def mineLocation(arrays)
  outter_index, inner_index = 0,0

  arrays.each_with_index do |subarr, out_idx|
    subarr.each_with_index do |num, in_idx|
      inner_index = in_idx if num == 1
      outter_index = out_idx if num == 1
    end
  end

  [outter_index, inner_index]
end



p mineLocation( [[1, 0, 0], [0, 0, 0], [0, 0, 0]] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]