=begin
Create a method that takes an array of integers as an argument and returns 
an array of two numbers that are closest together in value. If there are 
multiple pairs that are equally close, return the pair that occurs first 
in the array.

Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

Problem:
- Return an array of two numbers that are the closest together in value
- If there are multiple pairs that are equal in difference, return the first
  - occuring pair

- Input: array of integers
- Output: array of only 2 integers

Examples:
- [5, 25, 15, 11, 20] -> [15, 11]
  - 15 and 11 are the closest integers to each other, therefore return them in an array

- [12, 22, 7, 17] -> [12, 17]
  - [12, 17] & [17, 22] both have a difference of 5
    - however, [12, 17] occurs first and therefore is returned

Data Structures:
- array would allow to form combinations of each element
- can calculate difference of pairs

Algorithm:
- CREATE a pairs array
- ITERATE over array
  - for each element
   - form all 2 number combinations of the current num upto the last num
   - append them all into an array
- TRANSFORM the pairs array
  - FIND the difference between the two nums for each subarr
- FIND the idx value of the smallest difference
- SELECT the subarr at the idx of the smallest difference

=end

def closest_numbers(numbers)
  two_num_pairs = []

  numbers.size.times do |start_idx|
    (start_idx + 1).upto(numbers.size - 1) do |end_idx|
      two_num_pairs << [numbers[start_idx], numbers[end_idx]]
    end
  end
  
  smallest_diff = two_num_pairs.map {|subarr| subarr.max - subarr.min }

  index = smallest_diff.index(smallest_diff.min)

  two_num_pairs[index]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
