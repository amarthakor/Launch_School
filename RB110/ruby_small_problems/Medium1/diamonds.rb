=begin

Write a method that displays a 4-pointed diamond in an n x n grid, 
where n is an odd integer that is supplied as an argument to the method. 
You may assume that the argument will always be an odd integer.

Examples
diamond(3)

 *
***
 *

--- P
- given: integer
- return: string output of a diamond, size represented by the integer argument

--- E


--- D


--- A



=end

def diamond(num)

  arr = (1..num).to_a.select { |num| num.odd? }
  spacer = num / 2

  arr.each do |stars|
    puts " " * spacer + "*" * stars
    spacer -= 1
  end

  spacer = 1

  arr.reverse.each_with_index do |stars, idx|
    next if idx == 0
    puts " " * spacer + "*" * stars
    spacer += 1
  end
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)
diamond(11)