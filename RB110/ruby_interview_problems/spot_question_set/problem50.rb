=begin
1:19pm
You are going to be given an array of integers. Your job is to take that array
 and find an index N where the sum of the
integers to the left of N is equal to the sum of the integers to the right of N.
 If there is no index that would make this
happen, return -1.


Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any 
integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to 
the right of N. If you do not find an index that fits
these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

Problem: Given an array, return an integer

Rules:
- Find the index where the sum of integers on the left == sum of integers on the right
  - Return this index
- IF there are multiple answers, return the lowest correct index
- If there is no index that will solve the problem, return -1


Algorithm:
- ITERATE over the given array of nums/indexes
  - for each char
    - Check if the sum of digits to the left of the current num is == to the digit sum on the right
    - If so, return the index to the array
    - OTHERWISE, moveonto the next integer
- FINALLY, if the above did not already return an index value, return -1

=end

def find_even_index(numbers)
  numbers.each_with_index do |num, idx|
    return idx if idx == 0 && numbers[1..-1].sum == 0
    return idx if idx > 0 && (numbers[0..idx - 1].sum == numbers[idx + 1..-1].sum)
  end

  -1
end


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1