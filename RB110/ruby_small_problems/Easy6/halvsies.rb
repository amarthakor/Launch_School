=begin

Write a method that takes an Array as an argument, and returns two Arrays 
(as a pair of nested Arrays) that contain the first half and second half of
the original Array, respectively. If the original array contains an odd number
of elements, the middle element should be placed in the first half Array.

Ex.
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

--- P
- Given: Write a method that takes an array filled with integers as an argument
- Return: The given array should be be sorted into a nested array where the 
          - first array is composed of elements from the first half and the
          - second array is composed of elements from the second half if the
          - given array

  - Possible arguments are:
    1) even amount of elements in given array
      - split array evenly into two subarrays
        [[1, 2], [3, 4]]
    2) odd amount of elements in given array
      - split array oddly into two subarrays, the first subarray has 1 more than the
        second subarray
        [[1, 2, 3], [4, 5]]
    3) only 1 element in the given array
      - first and only element gets sorted into the first subarray,
      - second subarray is empty
        [[1], []]
    4) empty array argument given
      - return an array of empty nested subarrays
        [[], []]
 - Input: array of integers
 - OUTPUT: 2-layer nested array


--- E
- halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] - even amount of elements in the given array
    first array contains elements from the first half of the given array
        [1, 2, 3, 4] = 4 elements. 4 / 2 = 2, thus [1, 2] composes the first subarray
                                              this [3, 4] composes the second subarray
- halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]                                    
  - odd amount of elements in given subarray
    - extra element goes in first subarray
    - array size / 2 = 2.5. round up to 3 elements for first subarray
    - remaining elements go in second subarray


--- D
 - beginning: array
 - intermediate: use array ds to fufill problem req's and iterate over each element
 - ending: nested 2 layer subarray

--- A
- RETURN empty 2layer array if given array is empty
- RETURN 2 layer array with element pushed into first subarray if given array size is == 1
- FIND the size of my given array
- intialize my results array
- IF the size is even
 - put the first half elements in the first subarray
  - divide size array / 2, starting at the first element upto the half point, push
    the respective elements into results array
 - put the second half elements in the second subarray
  - from my halfway point upto the end of the array, push the respective values into results array
- IF the size is odd, 
  - put the first half + 1 elements in the first subarray
  - put the second half elements in the second subarray 
- RETURN nested array
=end

def halvsies(array)
  return [[], []] if array.empty?
  return [array, []] if array.size == 1
  results_array = []

  split_array(array, results_array)

  results_array
end

def split_array(array, final_array)
  half_arr_size = array.size / 2
  if array.size.even?
    final_array << array[0, half_arr_size]
    final_array << array[half_arr_size..-1]
  else
    final_array << array[0..half_arr_size]
    final_array << array[half_arr_size + 1..-1]
  end
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]