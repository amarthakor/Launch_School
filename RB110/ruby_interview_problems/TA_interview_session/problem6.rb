=begin
# Implement function that finds all fibonacci slices in a given array of integers. 
A Fibonacci slice is a sequence where every number after the first two is the 
sum of the two preceding ones. The minimum length is 3. -- Amar

# Test cases
puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []




--- P
- given: array of integers
- return: nested array
        - Find all fibonacci slices in a given array of integers
        - Fibonacci slice means the current number is the sum of the previous
          two numbers
        - Minimum length of 3 integers in given array

- new fibonacci numbers are not formed if there are less than 2 integers available
  - stop creating new fibo nums at index  -3
--- E
- find_fibonacci_slices([1, 1, 2, 3, 5, 8])
  - 1 + 1 = 2 -> [1, 1, 2]
  - 2 + 1 = 3 -> [1, 1, 2, 3]
  - 3 + 2 = 5 -> [1, 1, 2, 3]
  - 5 + 3 = 8 -> [1, 1, 2, 3, 5]
              -> [1, 1, 2, 3, 5, 8]

 - 10 + 22 = 32, not valid
 - 22 + 33 = 55, not valid
 - 33 + 43 = 76, not valid
 - 43 + 56 = 99, not valid
--- D
begin: array of integers
middle: 
ending: nested array of all fibonacci slices

--- A
- CREATE a results array to store all fibnacci slices
- FIND all possible combinations of integers at least 3 integers long up intil index -2
  - then move onto the next integer, i.e. index 1..-1
- SeLECT all combinations that are fibonacci seq slices and move them into resultsarr
  - first num + second num = 3rd num and so on for the entire array
- RETURN results array
=end

def find_fibonacci_slices(numbers)
  results = []
 
end



# Test cases
# puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect #== [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []