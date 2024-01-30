# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)
# Fibonacci sequence = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55...]
#
# ----- P
# Given an integer argument that represents the number of digits in the number,
# find the index value of the first number in the fibonacci sequence that is 
# composed of as many digits as specified
#
# Input: integer
# output: integer
#
# Explicit rules:
# - all input will be integers
# - fibonacci number is calculated as the two previous numbers in the collection
#     will amount to the value of the newest number in the sequence
# 
# ----- E
# find_fibonacci_index_by_length(10) == 45
#     where the argument 10 represents the first number in the fibo sequence with 10 digits
#     and the return value, 45, represents that fibo numbers index value in an array
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847
#
# D
# since we need to find index value as the return value, 
# an array will be used to hold values of the fibonacci sequence 
#
# A
# Given an integer argument;
#
# first create an array with the first two values of the fibo sequence [1, 1]
# set counter to 1 to reference 2nd digit in fibo seq
# set first_fibo_num to 0 to reference 1st digit in fibo seq
# set new_fibo_num to reference newest fibo number in sequence
# continually add new fibo numbers into our fibo_seq array until the num of digits of
#     the current fibonacci number == our integer argument
#   loop 
#       break if digit_size == current_fibo_number size/length
#       add next fibo_seq value into our fibo_seq array
#       increment 
# return the index value of the current fibonacci number
#   and increase it by 1 to reference the correct index value
#   as the index value started incrementing at the 2nd ele value

def find_fibonacci_index_by_length(digit_size)
  fibo_sequence = [1, 1]
  counter = 1
  first_fibo_num = 0
  new_fibo_num = 0

  loop do 
    break if digit_size <= new_fibo_num.to_s.length
    new_fibo_num = fibo_sequence[counter] + fibo_sequence[first_fibo_num]
    fibo_sequence << new_fibo_num
    counter += 1
    first_fibo_num += 1
  end
  counter + 1
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000)  == 4782
# puts find_fibonacci_index_by_length(10000) == 47847 => true