=begin
Given a List [] of n integers , find the minimum number to be inserted in a list, 
so that the sum of all elements of the list should equal the closest prime number.

Notes
List size is at least 2 .
List's numbers will only have positives (n > 0) .
Repetition of numbers in the list could occur .
The newer list's sum should equal the closest prime number.

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)

2- minimumNumber ({2,12,8,4,6}) ==> return (5)

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)

Problem: Given an array, return an integer

Rules:
- Return number is the minimum amount needed to be added to the given array of nums
  such that the sum of the new array is the next prime number
- If the current sum of the array is a prime number, return 0
- Given list will always be at least 2 integers
- Array will only contain positive integers
- Prime numbers are numbers that only have 2 factors, 1 and themselves
- 1 is not a prime number

Algorithm:
- CHECK if the current num is a prime num (helper method)
- RETURN 0 if the sum of the array is a prime number
- SET a total to the sum of the given array
- LOOP over the total
  - increment the total by +1
  - break if total is a prime number
- FIND the difference between total and the array sum
- RETURN that difference
=end


def minimum_number(array)
  return 0 if is_prime?(array.sum)
  total = array.sum

  loop do
    total += 1
    break if is_prime?(total)
  end

  total - array.sum
end

def is_prime?(number)
  factors = []
  2.upto(number) { |factor| factors << factor if number % factor == 0 }
  factors.size == 1
end



p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2