=begin

Create a method that takes an array of integers as an argument. The method 
should determine the minimum integer value that can be appended to the array 
so the sum of all the elements equal the closest prime number that is greater 
than the current sum of the numbers. For example, the numbers in [1, 2, 3] 
sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 
to the array to sum to 7.

Notes:

The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2) == 4


Problem: Given an array of integers, return an integer

Rules:
- Return integer should be the smallest value that can be
  added to the given array, such that the sum of all nums equal the
  closest prime number that is greater than the curret sum of the numbers

- What is a prime number?
  Any number that is only divisble by 1 and itself
- Closest prime number should be > the sum of the array
- 1 is not a prime number
- If the current num is a prime num, find the next greatest prime num

Algorithm:
- FIND if the current num isa prime num
  - num must be divisible by 1 and itself ONLY
  - Check if the num is evenly divisble by 2 upto itself - 1
  - if the total divisble nums is greater than 1
    - return false
  - else return true
- FIND the sum of the given array
- LOOP over the sum until a prime num is found
  - Increment the sum by +1
    - if its  aprime num, break the loop
    - otherwise, repeat the loop until prime is found
- SUBTRACT the prime num from the original sum
- RETURN the difference

=end

def is_prime?(num)
  factors = []
  2.upto(num) do |factor|
    factors << factor if num % factor == 0
  end

  factors.count == 1
end

def nearest_prime_sum(numbers)
  total = numbers.sum
  
  loop do
    total += 1
    break if is_prime?(total)
  end

  total - numbers.sum
end



p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
