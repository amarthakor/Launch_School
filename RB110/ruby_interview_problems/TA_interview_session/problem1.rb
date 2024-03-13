=begin
# Given an array of numbers, return true if any 5 consecutive numbers 
are greater than 3. If there are less than 5 numbers in the array, return 
true if all are greater than 3. -- Amar

# Test cases
puts check_consecutive_numbers([4, 5, 6, 7, 8]) # true
puts check_consecutive_numbers([2, 4, 5, 6, 7, 8]) # true
puts check_consecutive_numbers([1, 2, 3, 4, 5]) # false
puts check_consecutive_numbers([4, 4]) # true (less than 5 numbers, all greater than 3)
puts check_consecutive_numbers([2, 2]) # false (less than 5 numbers, not all greater than 3)

# Write a function that masks proper nouns and numbers in a sentence. 
Use * to mask proper nouns and use # to mask numbers. You may assume that 
a sentence will not begin with a proper noun and will not end with a number 
or proper noun. Numbers can only be integers. - Eric

--- P
- given: array of numbers
- return: return boolean true if;
        - any 5 consecutive numbers are greater than 3
        - if there are less than 5 integers in the array, return true if all are above 3
  
- return true if array size is less than 5 and all elements are greater than 3

--- E
- check_consecutive_numbers([1, 2, 3, 4, 5])
  - [1, 2, 3, 4, 5] - 5 consecutive numbers
    - [1, 2, 3] are not greater than 3, thus return false

- check_consecutive_numbers([2, 4, 5, 6, 7, 8]) # true
  - [2, 4, 5, 6, 7, 8]
  - [4, 5, 6, 7, 8] - 5 consecutive integers
    - all are above 3
      - thus return true

- [2, 2]
  - less than 5 elements in the array
  - all elements are not greater than 3
  - thus return false

--- D
beginning: array
intermediate: stick w/ array to create 5 element conecutive ppairs and analyze each element
              value
ending: boolean, true or false

--- A
- if array size < 5 and each value > 3 return true
  - otherwise return false
- CREATE all possible subarrays of 5 elements
- ITERATE through all subarrays of at least 5 elements long
  - If any subarrays have elements all greater than 3?
    - return true
  - otherwise
    - return false

=end

def check_consecutive_numbers(array)
  return true if array.size < 5 && array.map.all? { |num| num > 3 }
  return false if array.size < 5 && array.map { |num| num > 3 }.any?(false)

  subarrays = []
  array.size.times do |start_idx|
    4.upto(array.size - 1) do |end_idx|
      subarrays << array[start_idx..end_idx]
    end
  end

  subarrays = subarrays.select { |subarr| subarr.size == 5}

  subarrays.map do |subarr|
    subarr.map do |num|
      num > 3
    end
  end
  subarrays.all?
end

p check_consecutive_numbers([4, 5, 6, 7, 8]) # true
p check_consecutive_numbers([2, 4, 5, 6, 7, 8]) # true
p check_consecutive_numbers([1, 2, 3, 4, 5]) # false
puts check_consecutive_numbers([4, 4]) # true (less than 5 numbers, all greater than 3)
 puts check_consecutive_numbers([2, 2]) # false (less than 5 numbers, not all greater than 3)


