=begin
9:42pm
# Given 2 two arguments of an array of numbers and a number, find all the pairs 
that results in the forming a triangle with the number. 

# Note: To determine if three numbers form a triangle you have touse the Triangle 
Inequality Theorem, which states that the sum of two side lengths of a triangle is 
always greater than the third side. If this is true for all three combinations of 
added side lengths, then you will have a triangle.


Problem: Given an array of integers and an integer, return an array

Rules:
- Given array of integers represent 2 possible sides of a triangle, 2nd argument is the third side of triangle
- Find subarrays of integers from array that when combined w/ integer argument can forma  triangle
- Conditions:
  - Triangle is formed if the sum of two side lengths of a triangle is > than third side
    - any two sides must be greater than the third
  - Otherwise the numbers cannot form a triangle

Algorithm:
- CREATE an array to hold valid triangle legs
- FIND all combinations of subarray legs that are 2 legs in size
  - ITERATE over all elements
    - for each element 't'
      - ITERATE upto the last element 's'
        - append [t, s] into sub legs array
- SELECT all subarrays where the sum of the subarray is > than the third leg
  - SUM each subarray and if its sum is > than the third leg AND
  - the sum of third leg and first element are greater than 2nd elemtn AND
  - the sum of 2nd leg and third leg are greater than first leg
    - select it
- RETURN these triangle subarrays

=end

def find_triangle_pairs(array, third_side)
  sub_legs = []

  array.size.times do |first_leg|
    (first_leg + 1).upto(array.size - 1) do |second_leg|
      sub_legs << [array[first_leg], array[second_leg]]
    end
  end

  sub_legs.select do |subarr|
    subarr.sum > third_side && subarr[0] + third_side > subarr[1] && subarr[1] + third_side > subarr[0]
  end
end


# Test cases
p find_triangle_pairs([2, 3, 4, 5], 7) == [ [ 3, 5 ], [ 4, 5 ] ]
p find_triangle_pairs([1, 2, 3, 4], 10) == []
p find_triangle_pairs([7, 10, 12, 15], 9) == [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
p find_triangle_pairs([8, 2, 5, 6, 3], 4) == [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]