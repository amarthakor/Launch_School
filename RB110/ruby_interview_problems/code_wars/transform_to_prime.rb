=begin
Given a List [] of n integers , find minimum number to be inserted in a list, 
so that sum of all elements of list should equal the closest prime number .

- List size is at least 2 .
- List's numbers will only positives (n > 0) .
- Repetition of numbers in the list could occur .
- The newer list's sum should equal the closest prime number .

--- P
- GIVEN:  array of integers
- RETURN: one integer - the minimum number to be added to the given array
        - such that the sum of the array elements should equal the closest prime number

- prime number is number that is divisible by itself and 1 ONLY
  - 2, 3, 5, 7, 11, 13, 17, 19...
- 1 is NOT a prime number
- arrays will have at least 2 integers
- no negative numbers will be included
- new arrays total sum should equal the closest prime number
to do:
- want to find the sum of given array and check if it is a prime number
  - if its not a prime number, icnrement it by 1 and recheck if it is a rime number
  -repeat process until prime is found
  - find the difference ebtween prime number and array sum
--- E
- [3, 1, 2]
  - sum of this array is 6
  - closest prime number is 7
  - return 1

--- D
begin: array of integers
intermediate: remain in array to find sum easily
end: integer

--- A
- CHECK if a given num is a prime number
  - 
    - check if the number is evenly disivible by 1, 2, 3, 4, 5, 6, 7, 8, 9
      - if the num is only divisible by 1 and itself ( 2 nums )
        - it is prime
      - if the num is divisible by more than 2 factors
        - it is not prime

- return 0 if the sum of the array is a prime number
- SUM the given array
- ITERATE over the sum where
  - until the sum is a prime number
    - incremenet the sum by 1
- FIND the differnece between the prime number and the array sum
- RETURN the difference

=end

def minimum_number(array)
  return 0 if is_prime?(array.sum)
  arr_total = array.sum

  loop do
    arr_total += 1
    return arr_total - array.sum if is_prime?(arr_total)
  end
  
end

def is_prime?(num)
  factors = (1..num).to_a
  factors.map do |factor|
    num % factor  == 0
  end.count(true) == 2
end

p minimum_number([3, 1, 2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2