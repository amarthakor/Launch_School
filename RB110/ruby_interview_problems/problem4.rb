=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7]

# The tests above should print "true".

--- P
- GIVEN: array of integers
- RETURN: an array of two integers that are closest together in value

- assume array will never be empty
- assume objets w/n the array will always be integers
- what happens if multiple numbers have the same smallest number?
--- E
- closest_numbers([5, 25, 15, 11, 20]
  - 5, 25 = 20    25, 15 = 10  15, 11 = 4   11, 20 = 9
  - 5, 15 = 10    25, 11 = 14  15, 20 = 5
  - 5, 11 = 6     25, 20 = 5  
  - 5, 20 = 15

--- D
beginning: array
intermediate: stay within array to iterate over all elements and compare to one another
ending: array
--- A
- CREATE a results array
- CREATE all possible combinations of 2 integer combos
- FIND the difference between all possible 2 integer combos
- FIND the smallest value from all possible differences
- CHECK which 2 integer combo == smallest value difference
- RETURN results array
=end

def closest_numbers(numbers)
  possible_combos = find_possible_combinations(numbers)
  smallest_difference = find_smallest_difference(possible_combos)
  find_closest_numbers(possible_combos, smallest_difference)
end

def find_possible_combinations(numbers)
  all_possible_combos = []
  (numbers.size - 1).times do |start_idx|
    (start_idx + 1).upto(numbers.size - 1) do |end_idx|
      all_possible_combos << [numbers[start_idx], numbers[end_idx]]
    end
  end
  all_possible_combos
end

def find_smallest_difference(number_combos)
  number_combos = number_combos.map do |subarr|
    subarr[0] - subarr[1]
  end
  number_combos.map { |num| num.abs }.min
end

def find_closest_numbers(number_pairs, smallest_value)
  check_diff_value = 0
  number_pairs.each do |subarr|
    check_diff_value = (subarr[0] - subarr[1]).abs
    return subarr if check_diff_value == smallest_value
  end
end
  

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11] # true
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7] 