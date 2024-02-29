=begin

Write a method that returns an Array that contains every other element of an Array 
that is passed in as an argument. The values in the returned list should be those 
values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

--- P
- GIVEN: array of elements
- RETURN: array of elements at even indexes from original array
        - even index due to selecting 1st, 3rd, 5th, ... elements
- if given array is empty, return empty array
--- E
[2, 3, 4, 5, 6] -> 
  - select every other element starting w/ the first element
  - 1st, 3rd, 5th...
  -> [2, 4, 6]


--- D
beginning: given array
intermediate: stay within array to manipulate elements as needed and solve porblem requirements
end: returning an array

--- A
- SELECT all elements at an even index
- RETURN those selected elements


=end

def oddities(numbers)
  numbers.select.with_index { |_, idx| idx.even? }
end

# selects and returns an array of elements that have a position value 
# thats even, i.e., 2nd, 4th, 6th, element
def evenities(numbers)
  numbers.select.with_index { |_, idx| idx.odd? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

p evenities([2, 3, 4, 5, 6]) == [3, 5]
p evenities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
p evenities(['abc', 'def']) == ['def']
p evenities([123]) == []
p evenities([]) == []
p evenities([1, 2, 3, 4, 1]) == [2, 4]