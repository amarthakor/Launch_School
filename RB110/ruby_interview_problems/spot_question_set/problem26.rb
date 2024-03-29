=begin
accepts two integer arrays of equal length
compares the value each member in one array to the corresponding
member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference 
between each member pair.

Examples

[1, 2, 3], [4, 5, 6] --> 9 because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2] --> 16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1] --> 1 because (1 + 1) / 2

Problem: Given two array arguments, return an integer or float

Rules:
- Arrays must equal length
- Compare each element at the corresponding index in both arrays
- The difference between the two values is squared
- Returns the average of all squared differences

Algorithm:
- CREATE a squares array
- ITERATE over the first array
  - For each index
    - Find the differece between the current index and the idnex in the 2nd array
    - Square this value
    - Append it to the squares array
- SUM the squares array and divide it by its length

=end

def solution(set1, set2)
  squares = []

  set1.each_with_index do |num, idx|
    factor = num - set2[idx]
    squares << (factor * factor)
  end

  squares.sum / squares.length.to_f
end


p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1