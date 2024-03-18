=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides 
must be greater than the length of the longest side, and all sides must 
have lengths greater than 0: if either of these conditions is not 
satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as 
arguments, and returns a symbol :equilateral, :isosceles, :scalene, 
or :invalid depending on whether the triangle is equilateral, isosceles, 
scalene, or invalid.

Examples:
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

--- P
- given: 3 integers
- return: 1 of 4 symbols where;
        - :equilateral represents a triangle that is equal on all sides
        - :isosceles represents a triangle that has 2 equal sides, one different
        - :scalene represents a triangle that hsa 3 unequal sides
        - :invalid represents measurements that are not valid

- a valid triangle occurs when
  - all sides are greater than 0)
  - the two shortest sides must be greater than the longest side
  - invalid if either of these conditions are not met

--- E
(3, 3, 3) == :equalateral
  - all measurements are the same, none are 0

(3, 3, 1.5) == :isosceles
  - all lengths are greater than 0, 2 shortest are greater than the longest

(3, 4, 5) == :scalene
  - all lengths are different + greater than 0, two shrotest sum to be > the longest

(0, 3, 3) == :invalid
  - invalid bc one has length of 0

(3, 1, 1) == :invalid
  - two shortest lengths do not sum to be greater than the longest

--- D
begin: 3 integers
middle: hash to retrieve values if hash is used for symbols and array to sort/sum numbers
end: symbol

--- A
- RETURN :invalid if any of the lengths are 0
- CREATE an array of the 3 numbers and SORT them
- IF all nums are equal
  - :equalteral
- ELSE 2 nums are equal, one is different AND the 2 shortest lengths are > than the longest
  - :isosceles
- ELSE all nums are different and the 2 shortest lengths > the longest
  - :scalene
- ELSE
  - :invalid

=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  
  if sides.all?(side1)
    :equilateral
  elsif (sides.uniq.size == 2) && (sides[0..1].sum > sides[2])
    :isosceles
  elsif (sides.size == 3) && (sides[0..1].sum > sides[2])
    :scalene
  else
    :invalid
  end
end
 
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid