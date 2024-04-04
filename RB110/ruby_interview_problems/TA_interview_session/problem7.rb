=begin
# Given 2 two arguments of an array of numbers and a number, find 
all the pairs that results in the forming a triangle with the number.

# Note: To determine if three numbers form a triangle you have to 
use the Triangle Inequality Theorem, which states that the sum of 
two side lengths of a triangle is always greater than the third side. 
If this is true for all three combinations of added side lengths, then 
you will have a triangle.

# Problem:

=end

p find_triangle_pairs([2, 3, 4, 5], 7).inspect #  == [ [ 3, 5 ], [ 4, 5 ] ]
p find_triangle_pairs([1, 2, 3, 4], 10).inspect # ==  []
p find_triangle_pairs([7, 10, 12, 15], 9).inspect #==  [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
p find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect #==  [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]
