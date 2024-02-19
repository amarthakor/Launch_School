=begin
Write a method that takes an Array as an argument, and reverses its
elements in place; that is, mutate the Array passed into this method.
The return value should be the same Array object.

You cannot use #reverse or #reverse!

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true


--- P
 - Given: An array of objects as an argument
 - Do: Reverse the order of elements and mutate the original object
  Reqs: Object argument should be mutated, not return new value
        - index assignment?

  - arg = [1, 2, 3, 4]  # arg.object_id = 500
  - method(arg) => [4, 3, 2, 1]
  - arg = [4, 3, 2, 1]  # arg.object_id = 500

- Rules: Should not use methods/ modification that returns new values
- we are reversing the order of elements, but not modifying the actual value of
      - the elements themselves
- If we are passed an array with one element, we will return the same exact array
  - as no changes need to be done ( i.e. [1] == [1].reverse!)
- If our array given is empty, return an empty array


--- E
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true


--- D
- beginning: passed in an array as argument
- intermediate: probably be easiest to do mutating while remaining in array
    - need to mutate orginal array, maybe index assignment?
- end: problem requires an array return value


--- A
- Create copy array with same values as original array
  - push each value or original_array into copy_array
- Reassign our array to the values of the copy array in reverse order
  -initialize last_idx to -1 to reference end of array
    - for each element, reassign to copy_array[last_idx]
    - decrement last_idx by -1



=end

def reverse!(array)
  copy_array = []
  array.each { |num| copy_array << num }
  last_idx = -1

  array.each_index do |idx|
    array[idx] = copy_array[last_idx]
    last_idx -= 1
  end
end
# could have used sort method for more streamlined solution


list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true