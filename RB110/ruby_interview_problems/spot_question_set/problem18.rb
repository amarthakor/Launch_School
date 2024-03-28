=begin
Write a function, persistence, that takes in a positive parameter num and 
returns its multiplicative persistence, which is
the number of times you must multiply the digits in num until you reach 
a single digit.

For example:
persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
# and 4 has only one digit

persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
# 1*2*6=12, and finally 1*2=2
persistence(4) # returns 0, because 4 is already a one-digit number

Problem: Given an integer, return a new integer

Rules:
- Given itneger is a positive number
- Return its 'multiplicative persistence'

Examples:
- 39 -> 3
  - 3*9 = 27, 
    - 2*7 = 14
      - 1*4 = 4
  
- Given a number greater than 9
  - I want to multiply the digits of the num 
    - if the product is greater than 1 digit
      - repeat this process until a 1 digit product is reached
  - also want to track how many times it takes to find a 1 digit product
  - return that number of times 


Algorithm:
- RETURN 0 if the given arugment is less than 10
- CREATE a products array
- LOOP until...
  - take the given arugment and find the product of its digits
  - append this product to products array
  - break out of the loop if the product is 1 digit long
  - otherwise, i'll reassign the argument to the new product and repeat this process

- RETURN the count of elements in the products array
=end

def persistence(number)
  return 0 if number < 10
  products = []
  find_prod = number

  loop do 
    find_prod = find_prod.digits.inject(:*)
    products << find_prod
    break if find_prod.digits.size == 1
  end

  products.size
end




p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4