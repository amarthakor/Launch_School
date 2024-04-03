=begin
Complete the method that takes a hash/object/directory/association list of users,
 and find the nexus: the user whose
rank is the closest is equal to his honor. Return the rank of this user. 
For each user, the key is the rank and the value is the honor.
If nobody has an exact rank/honor match, return the rank of the user who comes closest.
 If there are several users who
come closest, return the one with the lowest rank (numeric value). 
The hash will not necessarily contain consecutive
rank numbers; return the best match from the ranks provided.

Example:
rank honor
users = { 1 => 93,
10 => 55,
15 => 30,
20 => 19, <--- nexus
23 => 11,
30 => 2 }

Problem: given a hash, return an itneger

Rules:
- Given a hash
  - return the 'nexus', key, that has the same value as its valu
  - If there are no exact matches, return the key that is most similar to its value
  - If there are multiple matches, return the lowest key

Algorithm:
- CREATE an empty array of differneces
- CONVERT the hash to an array
- ITERATE over the array of KV pairs
  - for each subarray
    - find the absolute value of index 0 - index 1
    - move that difference to the empty array
- FIND and set min_value to the smallest value in the array
- ITERATE thru the array of subarrays
  - for each subarray
    - check the difference to the smallest value
      - if they are the same, return the first index
=end

def nexus(pairs)
  differences = []
  pairs = pairs.to_a.sort

  pairs.each { |pair| differences << (pair[0] - pair[1]).abs }

  min_val = differences.min

  pairs.each { |pair| return pair[0] if (pair[0] - pair[1]).abs == min_val }
end

p nexus({1 => 3, 3 => 3, 5 => 1}) == 3
p nexus({1 => 10, 2 => 6, 3 => 4, 5 => 1}) == 3
p nexus({1 => 10, 2 => 3, 3 => 4, 5 => 1}) == 2