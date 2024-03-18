=begin
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
and all angles must be greater than 0: if either of these conditions is not 
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle 
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating 
point errors. You may also assume that the arguments are specified in degrees.

Examples:
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

--- P
 - given: 3 integer angles
 - return: symbol of triangle type
        - :right - 1 angle is at 90 degrees and all 3 sides == 180 and greater than 0
        - :acute - all angles less than 90, all add to 180 and greater than 0
        - :obtuse - 1 angle is > 90 degrees, all add to 180 and > 0
        - :invalid - sum is not 180 degrees and all are not > 0 degrees

        - integer arguments representing degrees of triangles
--- E
- what happens if 2 angles are 90?
  - invalid triangle since 1 will be 0

- if all are the same but below 180?
  - invalid 

--- D
beginning: 3 integers
middle: none
ending: symbol

--- A
- CREATE an array of integer angles
- IF the sum of all 3 != 180 || any of the nums are not > 0
  - return :invalid
- ELSE one of the triangles is 90 degrees and all sum to 180
  - :right
- ELSE one angle is 120 degrees 
  - :obtuse
- ELSE
  - :acute


=end

def triangle(s1, s2, s3)
  angles = [s1, s2, s3]

  if angles.sum != 180 || angles.any?(0)
    :invalid
  elsif angles.any?(90)
    :right
  elsif angles.any?(120)
    :obtuse
  else
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid