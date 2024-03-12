=begin
Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that
checks whether the two arrays have the "same" elements, with the same 
multiplicities (the multiplicity of a member is the number of times it appears).
"Same" means, here, that the elements in b are the elements in a squared, 
regardless of the order.

If a or b are nil (or null or None, depending on the language), 
the problem doesn't make sense so return false.
Examples:
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a, b) returns true because in b 121 is the square of 11, 14641 is the 
square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square 
of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

--- P
- given: two arrays of integers
- return: boolean true or false
    - if the second array (b) is composed of the squares of the first array (a)
      - return true
    - otherwise return false

- if either a or b are nil, return false
- assume arrays will always contain integers only
- assume no empty array arguments
--- E
a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
 -> true

--- D
beginning: arrays of integers
intermediate: use arrays to compare arrays and ensure b has the squares of a
ending: boolean

--- A
- RETURN false if arr1 or arr2 are nil
- TRANSFORM the first array
  - for each number
    - determine its square
- SUBTRACT arr1 from arr2
- RETURN true if the difference is an empty array
- RETURN false if the difference is not an empty array


=end

# refactored solution to handle randomly generated edge cases on codewars
def comp(arr1, arr2)
  return false if arr1 == nil || arr2 == nil
  arr1.sort!
  arr2.sort!
  
  arr1.map! { |num| num * num }
  arr1.map.with_index { |num, idx| num == arr2[idx] }.all?
end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

p comp(a, b) == true
