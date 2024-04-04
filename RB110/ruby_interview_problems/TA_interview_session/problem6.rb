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







# Test cases
# puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect #== [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []