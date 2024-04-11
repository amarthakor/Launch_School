=begin
Given a String as an argument, return an Array of all consecutive numbers from the String.
Consecutive numbers being: a series of numbers containing no other non-numeric characters.
Consecutive numbers must be larger than 1 digit, otherwise do not add these to the returned array.
Note: Spaces DO NOT break a series of numbers

p numbers_from_string('Ruby3.32') = [32]
p numbers_from_string('abc1234abc') == [1234]
p numbers_from_string('11abc1!23abc') == [11, 23]
p numbers_from_string('hello world!') == []
p numbers_from_string('1 2 3 4') == [1234]
p numbers_from_string('12abc7f24ghi1678!') == [12, 24, 1678]
=end


=begin
Given a string that includes alphanumeric characters ("3a4B2d") return the 
expansion of that string: The numeric values represent the occurrence of each 
letter preceding that numeric value. There should be no numeric characters in the 
final string.

p str_expansion("3D2a5d2f") == "DDDaadddddff"
p str_expansion("3abc") == "aaabbbccc"
p str_expansion("3d332f2a") == "dddffaa"
=end

=begin
# Given a collection of integers, write a method to return a new collection 
# of every unique contiguous subarray in that collection with an even sum. 
# The returned subarrays can be in any order.

p even_subs([1, 1, 1, 1, 1]).sort #== [[1, 1], [1, 1, 1, 1]]
p even_subs([1, 2, 3, 4, 5]).sort #== [[1, 2, 3], [1, 2, 3, 4], [2], [2, 3, 4, 5], [3, 4, 5], [4]]
p even_subs([88, 54, 67, 56, 36]).sort #== [[36], [54], [56], [56, 36], [88], [88, 54]]
end

=begin
5:23pm - 5:40pm
Given a list of integers and a single sum value, return the first two values
 (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second 
element has the smallest index is the solution.

Negative numbers and duplicate numbers can and will appear.

Problem: Given an array of integers and an integer, return nil or an array of integers

Rules:
- First argument, array of ints, are used to create pairs
- Second argument, an integer, is the target value
- Return the pair that sums to the target value (second argument, the integer)
- If there are multiple pairs that sum to the target integer, select the pair whose second elemtn
  has the smallest index from the given array

Examples:
- [1, 4, 8, 7, 3, 15], 8 -> [1, 7] which sum to 8
  [1, 4], [1, 8], [1, 7], [1, 3], [1, 15] -> [1, 7]
  [4, 8], [4, 7], [4, 3], [4, 15] X
  [8, 7], [8, 3], [8, 15] X
  [7, 3], [7, 15] X
  [3, 15] X
-> [1, 7] == 8

- [10, 5, 2, 3, 7, 5], 10 -> [3, 7]
  [10, 5]....
  [5, 2], [5, 3], [5, 7], [5, 5] -> [5, 5]
  [2...]
  [3, 7], [3, 5] -> [3, 7]
  -> [5, 5], [3, 7]
  - need a way to track index values of all correct pairs
    - correct pairs are those that add upto the target

DS:
- USE a hash where valid pairs are keys and values are index of the 2nd elemtn in key pair

Algorithm:
- CREATE an empty hash of KV pairs
- ADD KV pairs to hash by finding all array pairs and setting them to index value of second elemtn
  - ITERATE over each integer
    - for each integer
      - ITERATE upto the end of the array
        - if the pair sum is = to the target
          - create a KV pair where the pair is the key and the index of the second elemtn is the value
- SORT hash by value from least to greatest
  - sort_by value
    - this should return array...
- SELECT first KV pair from sorted hash

=end


# def sum_pairs(numbers, target)
#   valid_pairs = {}

#   numbers.size.times do |first_num|
#     (first_num + 1).upto(numbers.size - 1) do |second_num|
#       if numbers[first_num] + numbers[second_num] == target
#         valid_pairs[[numbers[first_num], numbers[second_num]]] = second_num
#       end
#     end
#   end

#   valid_pairs.empty? ? nil : valid_pairs.sort_by {|k, v| v }[0][0]
# end


# l1= [1, 4, 8, 7, 3, 15]
# l2= [1, -2, 3, 0, -6, 1]
# l3= [20, -13, 40]
# l4= [1, 2, 3, 4, 1, 0]
# l5= [10, 5, 2, 3, 7, 5]
# l6= [4, -2, 3, 3, 4]
# l7= [0, 2, 0]
# l8= [5, 9, 13, -3]

# p sum_pairs(l1, 8) == [1, 7]
# p sum_pairs(l2, -6) == [0, -6]
# p sum_pairs(l3, -7) == nil
# p sum_pairs(l4, 2) == [1, 1]
# p sum_pairs(l5, 10) == [3, 7]
# p sum_pairs(l6, 8) == [4, 4]
# p sum_pairs(l7, 0) == [0, 0]
# p sum_pairs(l8, 10) == [13, -3]

=begin

# CONVERT string into array of chars
# SET new_string to ''
# ITERATE over array of chars
  - for each char up until the second to last char
    - if the current char and the next char are the same
      next
    - else append hte current char to new_string
  - if index is last char
    - append the char to new_string
=end

def no_extra(string)
  string = string.chars
  no_dupes = ''

  string.each_with_index do |char, idx|
     char == string[idx + 1] ? next : no_dupes << char
  end

  no_dupes
end

p no_extra('bbbbbbbbb')
p no_extra('wwooonndeerrfull woorrlldd')