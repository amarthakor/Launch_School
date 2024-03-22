=begin
Create a method that takes a string argument that consists entirely of 
numeric digits and computes the greatest product of four consecutive 
digits in the string. The argument will always have more than 4 digits.

Examples:
p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 4 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6


Problem: Given a string of digits, return an integer

Rules:
- String argument will consist of numeric digits
- Return integer is the greatest product of 4 consecutuve digits in string
- Argument will always have greater than 4 digits

Algorithm:
- CREATE an products array to hold all possible products
- FIND all substrings of 4 consecutuve digits long
- ITERATE and TRANSFORM over all substrings
  - for each substring
    - convert the digits into integers and find the product of the number
    - append this product to the products array
- SELECT the alrgest product

=end

def greatest_product(str_num)
  products = []
  substrings = []

  (str_num.size - 3).times do |start_idx|
    substrings << str_num[start_idx..start_idx + 3].to_i
  end
  
  substrings.map { |num| products << num.digits.inject(:*) }
  
  products.max
end



p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 4 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
