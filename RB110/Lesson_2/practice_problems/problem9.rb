=begin

Given this data structure, return a new array of the same structure but with
the sub arrays being ordered (alphabetically or numerically as appropriate)
in descending order.

=end

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted_arr = arr.map do |subarr|
  subarr.sort { |a, b| b <=> a }
end

p sorted_arr

