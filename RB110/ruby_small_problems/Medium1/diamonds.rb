=begin
7:14pm

Write a method that displays a 4-pointed diamond in an n x n grid, 
where n is an odd integer that is supplied as an argument to the method. 
You may assume that the argument will always be an odd integer.

Examples
diamond(3)

 *
***
 *


Problem: Given an integer, return a *asteriks in the shape of a diamond

Rules:
- Given argument integer that is 'n'
- 'n' represents a diamond shape in an n * n grid
- Given num will always be odd integer

- Diamond shape will be n lines long and n lines across (square)
  -Midpoint of diamond will be n * long
  - Each line above and below the midpoint decreases in size * by 2
  - Start and end points both have exactly one * in the middle

Algorithm:
- CREATE an array that represents the top/bottom half of the diamond in odd integer stars
- SET a var to the starting space for the top half of the diamond
- SET a var to the starting space for the bottom half of the diamond
- ITERATE over odd nums array
  - for each num
    - output the top_space * ' ' followed by the num * '*'
    - decremeent top_space by 1 on each iteration
- OUTPUT n * '*'
- ITERATE over a reversed array of odd integers where
  - for each num
    - output the bottom_space * ' ' followed by the num * '*'
    - increment bottom_space by 1 on each iteration

=end

  # most recent solution when trying to solve problem again
def diamond(stars)
  num_of_stars = (1..stars - 1).to_a.select { |num| num.odd?}
  top_space = stars / 2
  bot_space = 1

  num_of_stars.each do |star|
    puts "#{' ' * top_space}#{'*' * star}"
    top_space -= 1
  end

  puts "#{'*' * stars}"

  num_of_stars.reverse.each do |star|
    puts "#{' ' * bot_space}#{'*' * star}"
    bot_space += 1
  end

end

  # original solution
# def diamond(num)

#   arr = (1..num).to_a.select { |num| num.odd? }
#   spacer = num / 2

#   arr.each do |stars|
#     puts " " * spacer + "*" * stars
#     spacer -= 1
#   end

#   spacer = 1

#   arr.reverse.each_with_index do |stars, idx|
#     next if idx == 0
#     puts " " * spacer + "*" * stars
#     spacer += 1
#   end
# end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)
diamond(11)