=begin
Your goal is to write the group_and_count method, which should receive and 
array as unique parameter and return a hash. Empty or nil input must 
return nil instead of a hash. This hash returned must contain as keys 
the unique values of the array, and as values the counting of each value.

Example usage:
input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:

Array#count
Array#length

--- P
- given: array of integers
- return: hash w/ KV pairs where the key represents a uniq integer from the given array
          - and the value represents the number of occurrences of the key
          - empty array/ nil input must return nil
          - key represents uniq integer from given array
          - value represents occurrence of uniq key

--- E
- [1, 1, 2, 2, 2, 3] -> {1=>2, 2=>3, 3=>1}
  - 1 appears twice, 2 appears three times, 3 appears once
    -> {1=>2, 2=>3, 3=>1}

- []
  - return nil since array is empty

--- D
begin: array
intermediate: hash to create kv pairs
end: hash

--- A
- RETURN nil if array empty or nil is given argument
- INITIRALIZE an empty results hash
- FIND all uniq integers from array to use as keys for the hash and set the
  keys equal to 0
- ITERATE over the given array and for each elemetn
  - incremenet the key by 1

=end

def group_and_count(array)
  return nil if array.empty? || array == nil
  results_hsh = {}
  array.uniq { |num| results_hsh[num] = 0 }
  array.each { |num| results_hsh[num] += 1}
  results_hsh
end

p group_and_count([]) == nil
p group_and_count([0, 1, 1, 0]) == { 0 => 2, 1 => 2}
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}