=begin

Given two arrays a and b write a function comp(a, b) that checks whether
the two arrays have the "same" elements,
with the same multiplicities. "Same" means, here, that the elements in b 
are the elements in a squared, regardless of
the order.

Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a, b) returns true because in b 121 is the square of 11, 14641 is the 
square of 121, 20736 the square of 144, 361
the square of 19, 25921 the square of 161, and so on. It gets obvious if 
we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays

If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 132 is not the square of any number of a.
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.

Remarks
a or b might be []
a or b might be nil or null or None or nothing 
If a or b are nil (or null or None), the problem doesn't make sense so return false.

Problem: Given two arrays of integers, return a boolean true/false

Rules:
- Return true if the elements are the 'same'
  - same means that the elements in b are the elements in a but squared
- order doesnt matter
- if A or B are empty or nil, return false
- all arrays must have uniq values
  - one square cant count for 2 base values
  - the counts for each square and base must be the same

Algorithm:
- RETURN false if a or b are empty or nil
- Square all values in first array
- ITERATE over transformed first array
  - for each num
    - check if the count of the current num in arg1 == arg2
- CHECK if the array contains all values of true
=end

def comp(a, b)
  return false if a == nil || b == nil
  a.map! { |num| num * num }
  
  a.map {|num| a.count(num) == b.count(num) }.all?
end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

p comp(a, b) # == true