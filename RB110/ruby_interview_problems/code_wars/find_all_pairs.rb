=begin
You are given array of integers, your task will be to count all pairs 
in that array and return their count.

  Notes:

- Array can be empty or contain only one value; in this case return 0
- If there are more pairs of a certain number, count each pair only once.
     E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
- Random tests: maximum array length is 1000, range of values in array 
     is between 0 and 1000

  EXAMPLES:
  [1, 2, 5, 6, 5, 2]  -->  2
  [1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4

--- P
- GIVEN: arry of integers
- RETURN: integer representing all pairs in the given array
        - return 0 if array size is > 1
        - dupliate pairs should be included in the count
        - max elemental length is 1000, range varies from 0..1000
--- E
- [1, 2, 2, 20, 6, 20, 2, 6, 2] -> 4
    - four 2's, [2, 2, 2, 2], thus 2 pairs -> 2
    - 2 20's, thus 1 pair
    - 2 6's, thus 1 pair
    - 4 total pairs
    return 4

--- D
begin: array of ints
middle: utitlize array to determine pairs for 
end: integer

--- A
- FIND all uniq values
- CREATE total pairs var
- For each uniq value
    - FIND how many times the value appears in the original array
    - If any uniq value appears more than 1x, 
        - divide the count by 2 and increment the value of totail pairs

=end

def find_all_pairs(numbers)
  total_pairs = 0
  uniq_nums = numbers.uniq

  uniq_nums.each { |num|  total_pairs += (numbers.count(num) / 2) }

  total_pairs
end

p find_all_pairs([1, 2, 5, 6, 5, 2])  == 2
p find_all_pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])  == 4
p find_all_pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p find_all_pairs([1000, 1000]) == 1
p find_all_pairs([]) == 0
p find_all_pairs([54]) == 0