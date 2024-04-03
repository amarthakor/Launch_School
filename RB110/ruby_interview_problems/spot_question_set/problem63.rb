=begin
You are given an array (which will have a length of at least 3, but could be very large)
 containing integers. The array is
either entirely comprised of odd integers or entirely comprised of even 
integers except for a single integer N. Write a
method that takes the array as an argument and returns this "outlier" N.


Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)
[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)


Problem: Given an array of integers, return an integer

RuleS:
- Given array size >= 3
- All integer elements are odd or even except for 1
- Return integer should be the 'odd one out' aka 1 even or 1odd integer

Algorithm:
- SET even_num, odd_nums to 0
- ITERATE over the array
  - for each char
    - if num is even, increment even_nums by 1
    - else incremement odd_nums by 1
- If even nums == 1
  - iterate thru the array and return the integer thats even
- else 
  - iterate thru the array and return the integer thats odd

=end

def find_outlier(array)
  even_nums, odd_nums = 0, 0

  array.each { |num| num % 2 == 0 ? (even_nums += 1) : (odd_nums +=1) }
  
  if even_nums == 1
    (array.select {|num| num.even? }[0])
  else
    (array.select {|num| num.odd? }[0])
  end
end


p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) #== 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) #== 160