=begin
Complete the greatestProduct method so that it'll find the greatest product
of five consecutive digits in the given string of digits.

For example:
greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

--- P
- GIVEN: string of digits
- RETURN: the greatest product of 5 consecutive digits
        - choose the greatest product out of all combinations of 
          5 consecutive digits
- The input string will always have more than 5 digits
--- E
- ("123834539327238239583") == should return 3240
  - 1x2x3x8x3 == 144
  - 2x3x8x3x4 = 576
  - 3x8x3x4x5 = 1440
  ....
  - 3x9x5x8x3 == 3240

--- D
begin: string
middle: array or string slice
end: integer

--- A
- CREATE a results array
- CREATE subarrays of 5 consecutive digits, starting from index 0..-1
- TRANSFORM all elements within the subarrs to integers
- FIND the sum of each subarr and push it to the result sarray
- SELECT the largest numb
number.size - 4).times
=end

def greatest_product(number)
  all_products = []
  all_combinations = []
  end_idx = 4
  (number.size - 4).times do |start_idx|
    all_products << [number[start_idx..end_idx]]
    end_idx += 1
  end
  all_products

  all_products.map do |subarr|
    subarr.map! { |num| num.to_i }
  end

  all_products.each do |subarr|
    subarr.each do |num|
      if num.digits.size == 5
        all_combinations << num.digits.inject(:*)
      end
    end
  end

  all_combinations.max
end

p greatest_product('123834539327238239583') # == 3240
p greatest_product('395831238345393272382') # == 3240
p greatest_product('92494737828244222221111111532909999') # == 5292