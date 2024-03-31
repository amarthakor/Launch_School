=begin
Sort the given strings in alphabetical order, case insensitive. 

For example:
["Hello", "there", "I'm", "fine"] --> ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"]) --> ["a", "B", "C", "d"]

Problem: Given an array, return an array

Rules:
- New or moutated array?
- CASE does not matter when sorting
- Sort by alphabetical order

Algorithm:
- ITERATE over the array
  - for each element
    - sort by lowercase chars


=end

def sortme(array)
  array.sort_by { |el| el.downcase }
end


p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]