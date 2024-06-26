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

=begin

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

=end

=begin
DIGITS = ('0'..'9').to_a

def order(words)
  results = {}

  words.split.each do |word|
    word.chars.each do |char|
      results[word] = char.to_i if DIGITS.include?(char)
    end
  end
  
  p results.sort_by { |k, v| v }.map { |pair| pair[0] }.join(' ')
end



p order("is2 Thi1s T4est 3a")
=end

=begin
1:15

Create a method that takes an array of integers as an argument. Determine 
and return the index N for which all numbers with an index less than N sum 
to the same value as the numbers with an index greater than N. If there is 
no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the 
smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the
numbers to the right of the last element is 0.


Problem: Given a array of integers, return an itneger

Rules:
- Find the index at which
  - all numbers to the left of the current index sum and all numbers to the right of the current index sum
    are equivalent
- IF there are no indices at which this occurs return -1

- IF there are multiple indices that fufill this condition, i want return the smallest index
- numbers to the left of index 0 sum to 0 and same for numbers to the right of the last elemtn
  - first element left sum is 0, last element right sum is 0


Examples
- [1, 2, 4, 4, 2, 3, 2] -> 3
  1 + 2 + 4 | 4 | 2 + 3 + 2
      7     | 4 |     7

- [0, 20, 10, -60, 5, 25] -> 0
  0 | 0 | 20 + 10 + -60 + 5 + 25
  0 |0| 0

  0 + 20 + 10 |-60| 5 + 25
      30      |-60|   30

Algorithm:
- ITERATE over all elemnts and their idnices in the array
  - for each element 
    - if the index is == 0
      return the index if 0 == array[1..-1].sum
    - elsif the idx is > 0
      return the index IF array[0..idx - 1] == array[idx+1..01]

- REturn -1
=end

def equal_sum_index(array)
  array.each_with_index do |_, idx|
    if idx == 0
      return idx if 0 == array[1..-1].sum
    elsif idx > 0
      return idx if array[0..idx - 1].sum == array[idx + 1..-1].sum
    end
  end

  -1
end


p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) #== 0
