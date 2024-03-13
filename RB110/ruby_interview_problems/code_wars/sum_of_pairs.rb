=begin
Given a list of integers and a single sum value, return the first two values 
(parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second 
element has the smallest index is the solution.

Negative numbers and duplicate numbers can and will appear.

--- P
- given: array of integers and a single sum value
- return: first two values in order of appearance that add up to the sum value

- if there are 2+ pairs that add up to the target sum, the pair whose second
  element has the smallest index is the solution

- integers can be negative and/or duplicates
- if a sum is not reachable with the given array, return nil
--- E
- sum_pairs([11, 3, 7, 5],         10)
  - 11+3 == 14 does not equal 10
  - 3 + 7 == 10 --> equal 10
  -> [3, 7]

- sum_pairs([10, 5, 2, 3, 7, 5],         10)
  - [ 5 + 5] -> 10
    - index 1 and 5
  - [3 + 7] -> 10
    - index 3 and 4
  - since [3, 7] has the lowest index value for the second pair, 
    choose the second pair over the first one

--- D
beginning: array of integers, target integer sum
intermediate: use array to find sum pairs 
ending: array

--- A
- INITIALIZE a results array
- CREATE all possible 2 integer combination pairs starting from left to right
  - i.e. [1, 2, 3, 4] == [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
- TRANSFOERM all pairs that sum to the target sum to boolean true

- 

=end

def sum_pairs(array, sum)
  idx_values = []
  pair_combos = []
  final_pair = []

  make_pairs(array, idx_values, pair_combos)

  results = pair_combos.select { |pairs| pairs.sum == sum }
  return nil if results.empty?

  valid_indices = find_valid_indices(array, sum, idx_values)

  current_value = valid_indices.map { |subarr| subarr[1] }.max

  valid_indices.each { |subarr| final_pair = subarr if subarr[1] < current_value }

  return results.flatten if results.size == 1
  return_final_pair(array, final_pair)
end

def make_pairs(arr, indices, pairs)
  arr.size.times do |start_idx|
    (start_idx + 1).upto(arr.size - 1) do |end_idx|
      pairs << [arr[start_idx], arr[end_idx]]
      indices << [start_idx, end_idx]
    end
  end
end

def find_valid_indices(arr, sum, indices)
  indices.select do |subarr|
    arr[subarr[0]] + arr[subarr[1]] == sum
  end
end

def find_correct_indices(indices, results_arr, max_index)
  indices.each { |subarr| results_arr = subarr if subarr[1] < max_index }
end

def return_final_pair(arr, indices)
  ([arr[indices[0]], arr[indices[1]]])
end


l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]