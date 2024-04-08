=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each 
number is the sum of the two previous numbers: the 3rd Fibonacci number is 
1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. 

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501



Problem: given a number, return another number

Rules:
- Given number represents the nth number of the fibonacci sequence
- Return number is the value of the nth number in the fibonacci sequence
- fibonacci sequence starts off with 1, 1
  - each new nem is the sum of the two previous numbers
- CANNOT use recursion
- So the fibonacci sequence goes as 1, 1, 2, 3, 5, 8....
                                    1, 2, 3, 4, 5, 6

Algorithm:
- CREATE array with first 2 numbers in the fibo sequence
- ITERATE from 3 to the given integer
  - find the sum of the last 2 numbers in the array
    - push that num into the numbers array
- Return the last num in the numbers array


=end

def fibonacci(nth)
  fibo_seq = [0, 1, 1]

  3.upto(nth) { |_| fibo_seq << fibo_seq[-2, 2].sum }

  fibo_seq[-1]
end



p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
  # test case below returns 20,899 digit long number
# p fibonacci(100_001) #== 4202692702.....8285979669707537501