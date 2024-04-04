=begin
Write a function that calculates the sum of all numbers in a nested array. 
The array may contain integers,
# nested arrays of integers, or a mix of both. (for ruby and JS don't use flatten)


=end

def sum_of_nested_array(numbers)
  numbers.join(' ').split.map { |num| num.to_i }.sum
end

p sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) == 21
 p sum_of_nested_array([10, [20, 30, [40]], 50]) == 150
