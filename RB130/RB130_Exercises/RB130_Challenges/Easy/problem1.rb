=begin
Write a program to determine whether a triangle is
- equilateral,
- isosceles
- scalene

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0,
and the sum of the lengths of any two sides must be greater than the
length of the third side.

---- P

Problem: Given 3 integers, determine whether the triangle is equilatral, isosoceles, or scalene

Rules:
- All sides must be > 0
- Sum of any two sides must be > third side
- Equilateral triangles have same sides for all lengths
  - a, b, c > 0
  - a == b == c
- Isosceles triangles have 2 sides the same, 1 different
  - a == b or b == c or a == c
  - a, b, c > 0
  - a + b > c
  - a + c > b
  - b + c > a
- Scalene triangles have 3 different lengths
  - a, b, c > 0
  - a + b > c
  - a + c > b
  - b + c > a

---- E

5, 5, 6
  - isosceles?
  - 5 + 5 > 6
  - 6 + 5 > 5
  - true
- 3, 4, 5
  - scalene
  - 3 + 4 > 5
  - 3 + 5 > 4
  - 4 + 5 > 3
  - true

---- D
- probably array to handle all 3 sides

---- A
CREATE Triangle class
  - set side lengths to array of 3 integer arguments
  - set @kind to return value of instance method
- HELPER method to determine kind of triangle
  - use test cases as above
=end

# Class for creating instances of triangles
class Triangle
  attr_reader :kind

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    valid_triangle?
    @kind = nil

    type?
  end

  def type?
    if @sides.any?(0)
      @kind = "neither"
    elsif @sides.uniq.size == 1
      @kind = "equilateral"
    elsif @sides.uniq.size == 2
      @kind = "isosceles"
    elsif @sides.uniq.size == 3
      @kind = "scalene"
    else
      @kind = "neither"
    end
  end

  def valid_triangle?
    if (@sides[0] + @sides[1] > @sides[2]) &&
       (@sides[0] + @sides[2] > @sides[1]) &&
       (@sides[1] + @sides[2] > @sides[0])
      true
    else
      raise ArgumentError
    end
  end
end

equilateral = Triangle.new(3, 4, 5)
p equilateral
