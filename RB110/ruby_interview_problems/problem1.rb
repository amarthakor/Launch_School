# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".
=begin
--- P
- GIVEN: array of integers
- RETURN: an array of integers where
          - each integer in the new array represents the count of numbers smaller than it
            (from the original array)
          - only count uniq values, i.e., if a number is bigger than 3 numbers, but 2 of those
            numbers are the same, the given integers represententaiton in the new array
            should only be 2, as duplicates are not counted
- if there is only one element in the given array, return [0]
- how to handle empty array argument?
- assume array will only contian integers
--- E
- p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
  - given array of 5 integers
  - first element, 8, is bigger than all other elements
  - 4 other elements, however 2 is a duplicate
  - thus 8 should be represented by 3 in the new array
  ...
  - next element is 1, smallest element in array
    - thus 0 is returned
  - next element is 2, bigger than 1 other element
    - thus 1 is returned
  - next element is also 2, bigger than 1 other element
    - thus 1 is returned
  - last element is 3, bugger than 3 other elements, but two of them are duplicates (2)
    - thus 2 is returned

--- D
-beginning: array of integers
intermediate: array is ideal for either transformation or modification of eahc element
ending: array of integers

--- A
- FIND the size of the given array
  - iterate array size times #size, #times
- ITERATE over each element
  - for each element
    - compare the current num to each element in the array
    - if the current iteration is bigger than the current array element
      - append that current array elemtn into a new array
    - once iteration is done for the current element
    - remove the duplicates in the new array and find its size
    - append the size of the new array into the results array
- RETURN the results array

=end

def smaller_numbers_than_current(numbers)
  results_array = []

  numbers.size.times do |start_idx|
    results = []
    numbers.each { |num| results << num if numbers[start_idx] > num }
    results_array << results.uniq.count
  end

  results_array
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".