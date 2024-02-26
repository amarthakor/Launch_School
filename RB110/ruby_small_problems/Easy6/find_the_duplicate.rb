=begin
Given an unordered array and the information that exactly one valu
in the array occurs twice (every other value occurs exactly once),
how would you determine which value occurs twice? Write a method that
will find and return the duplicate value that is known to be in the array.

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

--- P
- given: array of integers, where ONLY ONE integer appears twice
- do:  Find which integer appears TWICE

  - only provided array of integers
  - every integer appears once except one random integer
  - elements are not in any numerical order
  - need to find integer that appears more than once
  - what happens if there are no duplicates in given argument?
  - what happens if given array is empty?
--- E
- find_dup([1, 5, 3, 1]) == 1
  - every integer that appears once : 5, 3
  - every integer that appears twice : 1
    - only one integer appears twice (1), all others appear once (3, 5)
  - return value is the integer that appears more than 1

--- D
beginning: array of integers
intermediate: array to iterate or evaluate current element and possibly 
              find/select duplicate?
ending: integer
--- A
- for each element, find the amount of times it appears in the array
    - array.each to iterate over array
  - if the # of times it appears is greater than 1, return that element
    - employ if conditional where i count the current elements appearances
      in the calling array and return element if it appears more than twice
        - array.count(current_num) ?

=end

def find_dup(array)
  array.each { |num| return num if (array.count(num) > 1) }
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([1, 2, 3, 4, 5, 5]) == 5
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73