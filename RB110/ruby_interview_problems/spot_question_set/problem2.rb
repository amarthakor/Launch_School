=begin
Find all pairs
You are given array of integers, your task will be to count all pairs 
in that array and return their count.

Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. 

E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples
[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

Problem: Given an array of integers, return an integer

Rules:
- Return integer represents the count of pairs in the given array
- Given array can be empty or only contain 1 number -> return 0 since no pairs
- Each pair is counted exactly once
  - [0, 0, 0, 0] = four 0's which is 2 pairs so return -> 2

Algorithm:
- RETURN 0 if array empty or has a size of 1
- CREATE a total_pairs var and set it to 0
- ITERATE over the given array but only uniq characters
  - for each uniq char
  - find out the quotient of its total count in the original array divided by 2
  - increment total_pairs by this value
- RETURN the total pairs value

=end

def pairs(numbers)

  total_pairs = 0

  numbers.uniq.each { |num| total_pairs += numbers.count(num) / 2 }

  total_pairs
end


p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0