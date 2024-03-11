=begin
A palindrome is a word, phrase, number, or other sequence of characters 
which reads the same backward as forward. Examples of numerical palindromes are:

2332
110011
54322345

You'll be given 2 numbers as arguments: (num,s). Write a function which returns
an array of s number of numerical palindromes that come after num. If num is a 
palindrome itself, it should be included in the count.

Return "Not valid" instead if any one of the inputs is not an integer or is 
less than 0.

For this kata, single digit numbers will NOT be considered numerical 
palindromes.


palindrome(6,4) # => [11,22,33,44]
palindrome(59,3) # => [66,77,88]
palindrome(101,2) # => [101,111]
palindrome("15651",5) # => "Not valid" 
palindrome(1221,"8") # => "Not valid"


--- P
- GIVEN:  2 arguments, can be either an integer/string
- RETURN: array of integers or "not valid"

  - return "Not valid" if given a negative num or string argument
  - palindrome is a number that is the same reversed
    - number == number.reversed
    - 123 == 321
  -  single digits palindromes
  - 

--- E
palindrome(6,4) # => [11,22,33,44]
  - 6 == num
  - 4 == s, the size of the return array 
  - find all palindromes that come after 6
  - start at my first argument
  - then find all palindromic numbers that come after 6
    - hold plaindromes
  - stop once array size is equal to s

--- D
begin: two integers
intermediate: use array to fulfill prob req's and find possible palindromes
end: array or string

--- A
- RETURN 'not valid' if arg 1 or 2 are strings
- RETURN 'not valid' if arg1/2 are negative
  - arg1 != arg1.abs
- INITIALIZE results array
- FIND x amount of palindromic numbers, as specified by argument 2
  - loop over first argument
    - check if current arg is a palindrome ( num.to_s == num.to_s.reverse)
    - check if the current arg is at least 2 digits long
      - if so, append to results
    - increment num by += 1 each iteration
    - break loop once results array size is equal to argument 2
- RETURN results array
=end

def palindrome(num, size)
  return "Not valid" if num.class == String || size.class == String
  return "Not valid" if num != num.abs || size != size.abs
  results_arr = []

  loop do
    results_arr << num if num.to_s == num.to_s.reverse && num.to_s.length > 1
    num += 1
    break if results_arr.size == size
  end

  results_arr
end

p palindrome(6,4) == [11,22,33,44]
p palindrome(59,3)  == [66,77,88]
p palindrome(101,2)  == [101,111]
p palindrome("15651",5)  == "Not valid" 
p palindrome(1221,"8") == "Not valid"

p palindrome(-1,5) == "Not valid"
p palindrome(-1,-5) == "Not valid"
p palindrome(1,-5) == "Not valid"
p palindrome(6,0) == []
