=begin

Given the following data structure use a combination of methods, including
either the select or reject method, to return a new array identical in
structure to the original but containing only the integers that are multiples
of 3.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

The returned array should have the following value:
[[], [3, 12], [9], [15]]

=end

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

p (arr.map do |subarr|
  subarr.select do |num|
    num % 3 == 0
  end
end)
