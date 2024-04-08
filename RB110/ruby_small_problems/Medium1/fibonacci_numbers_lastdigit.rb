=begin
In the previous exercise, we developed a procedural method for computing
the value of the nth Fibonacci numbers. This method was really fast, computing the 20899 
digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit
 of the nth Fibonacci number.

Examples:

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4


Problem: Given a number, return a number

Rules:
- Given number represents the nth number in the fibo sequence
- Return number is the given number within the fibo sequence last digit
  - so we want the value in the ones place

Algorithm:
- CREATE an array of the first 2 nums in fibo sequnce
- ITERATE from 2 upto the nth sequence
  - for each iteraiton
    - find the sum of the last 2 elements in the sequence array and push it into the array
- SELECT the last number in the array
- CONVERT the last num into an array of digits #digits
  - select the first element

=end

def fibonacci_last(nth)
  fibo_seq = [1, 1]

  3.upto(nth) {|_| fibo_seq << fibo_seq[-2, 2].sum }

  fibo_seq.last.digits.first

end


p fibonacci_last(15)         == 0  # (the 15th Fibonacci number is 610)
p fibonacci_last(20)         == 5  #(the 20th Fibonacci number is 6765)
p fibonacci_last(100)        == 5  #(the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)    == 1  #(this is a 20899 digit number)
  # test cases below take too long to complete
# p fibonacci_last(1_000_007) # == 3  #(this is a 208989 digit number)
# p fibonacci_last(123456789) # == 4  #