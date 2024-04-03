=begin
Your goal is to write the group_and_count method, which should 
receive an array as a unique parameter and return a
hash. Empty or nil input must return nil instead of a hash. 
This hash returned must contain as keys the unique values of
the array, and as values the counting of each value.

Example usage:
input = [1,1,2,2,2,3]
group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:
Array#count
Array#length

Problem: Given an array or nil value, return a hash or nil

Rules:
- Given an array return a hash
- Empty or nil input returns nil
- Return hash has keys that are unique integers of given array
  - Values are the counts of the uniq array

- CANNOT use Array#count or Array#length

Algorithm:
- RETURN nil if given empty array or nil
- CREATE a results hash
- ITERATE over a unique value array
  - for each num
    - Create a KV pair w/ key being current num and value being 0
- ITERATE over regular array
  - for each num
  - increment the value associated with the current key by +1
- RETURN the hash
=end

def group_and_count(numbers)
  return nil if numbers == nil || numbers.empty?
  results = {}

  numbers.uniq.each {|num| results[num] = 0 }
  numbers.each {|num| results[num] += 1 }
  
  results
end



p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}