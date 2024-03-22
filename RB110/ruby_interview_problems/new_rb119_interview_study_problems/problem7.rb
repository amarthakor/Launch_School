=begin
Create a method that takes an array of integers as an argument and returns 
the number of identical pairs of integers in that array. For instance, 
the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two 
occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. 
For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should 
return 2. The first array contains two complete pairs while the second has 
an extra 2 that isn't part of the other two pairs.

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
7:07pm

Problem:
- Given an array of integers, return the number of identical pairs in the array

Rules:
- If there are multiple pairs of the same number, return each pair
  [1, 1, 1, 1] has 2 pairs of 1, so return 2
- Every multiple of 2 occurrences count as a pair
  - 2 1's, 4 1's, 6 1's = 1, 2, 3 pairs
  - 3 1's, 5 1's, 7 1's = 1, 2, 3 pairs
- Return 0 if there are no pairs or the array is empty

Algorithm:
- RETURN 0 if array is empty
- CREATE a pairs variable and set it to 0 to track each pair
- CREATE an array of unique numbers
- ITERATE over the array of unique numbers
  - for each unique number
    - divide the current num by 2 and increment the pairs variable by that value
- RETURN the pairs variable value
=end

def pairs(numbers)
  num_of_pairs = 0

  numbers.uniq.each do |num|
    num_of_pairs += numbers.count(num) / 2
  end

  num_of_pairs
end


p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3