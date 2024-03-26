=begin
The Fibonacci series is a sequence of numbers starting with 1 and 1 where each 
number is the sum of the two previous numbers: the 3rd Fibonacci number is 
1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. 
In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods. A recursive method 
is one in which the method calls itself. 
For example:

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end


sum is a recursive method that computes the sum of all integers between 1 and n.

Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to stop 
recursing; and, n + sum(n - 1) uses the return value of the recursive call to compute
a new return value.

Write a recursive method that computes the nth Fibonacci number, where nth is 
an argument to the method.

fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

Problem: Given an integer, return a new integer

Rules:
- The given integer represents the nth number in the fibonacci sequence
  - I.E., 5 would represent the 5th number in the fibonacci sequence
- The return integer is a number in the fibonacci sequence
- The fibonacci sequence is the sequence where each new number in the
  sequence is the sum of the previous two numbers
- The first two numbers in the fibo sequence will always be 1
- Have to use recursion w/n the method
  - recursion is where the method calls itself WITHIN the method


Algorithm:
- RETURN 1 if given integer is 1 or 2
- FIND nth numbers of fibo sequence and sum them all recurisvely
  - ( (n - 1) + method(n - 1) ) sum 

=end

def fibonacci(number)
  return 1 if number <= 2

  fibonacci(number - 1) + fibonacci(number - 2)
end

# p fibonacci(1)  #== 1
# p fibonacci(2)  #== 1
# p fibonacci(3)  #== 2
p fibonacci(4)  #== 3
# p fibonacci(5)  #== 5
# p fibonacci(12) # == 144
# p fibonacci(20) # == 6765