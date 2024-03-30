=begin
Complete the greatestProduct method so that it'll find the greatest 
product of five consecutive digits in the given string of
digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

Problem: Given a string, return an integer

Rules:
- Return integer should be the greatest product of 5 consecutive integers
  - from the given string

- Need to find all substrings of 5 consecutive digits
- Find the product for each substring
- Return the largest product


Algorithm:
- FIND all substrings of 5 chars long
- ITERATE over the substrings of 5 long integers
  - for each substring
    - set product to 1
    - iterate over all chars
      - convert current char to integer
      - increment product by *= for each char
    - append this final value of product to the products array
- FIND the product of all substring integers
- RETURN the largest product 

=end

def greatest_product(str_num)
  substrings, products = [], []

  (str_num.size - 4).times do |start_idx|
    substrings << str_num[start_idx..start_idx + 4]
  end

  substrings.each do |number|
    product = 1
    number.chars.each { |digit| product *= digit.to_i }
    products << product
  end

  products.max
end




p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0