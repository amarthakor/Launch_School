=begin
Write a method that rotates an array by moving the first element to the
end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

--- P
- GIVEN: array of objects
- RETURN: a new array with all the objets rotated
          - rotated means the first element becomes the last element
            - dont have to actually shift each element
          - cannot modify original array
          - cant use #rotate or #rotate!

- assume array will have at least one element
--- E
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  - take element at index 0 and move to index -1
  - return new array
rotate_array(['a']) == ['a']
  - if only 1 element array, just RETURN original array


--- D
begin: array
mid: array to fulfill problem requriements and allow easy array modifiaction
end: array

--- A
- RETURN given array if array size is 1 element
- CREATE new array
- MODIFY new array to have given_array[1..-1]
  - maybe iterate thru and move all elements except index 0
- APPEND index 0 to new array
- RETURN new array

=end

def rotate_array(array)
  RETURN array if array.size == 1
  results_array = []

  array.each_with_index do |el, idx| 
    next if idx == 0
    results_array << el
  end

  results_array << array[0]
end

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4] 