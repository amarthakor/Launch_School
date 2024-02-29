=begin
Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

--- P
- GIVEN: grocery list aka array of subarrays consisitng of fruits with quantities
- RETURN: array of fruit where fruit appears as many times as specified
          - in the orginal subarray
- return array should be flat / merged
- what happens if given arg is empty?
- what happens if given arg contains non-strings/integers?
--- E
[['apples', 3]] -> [apples, apples, apples,]

--- D
beginning: array of subarrays
intermediate: use hash to multiple key by value times 
end: array
--- A
- CONVERT Nested array into hash
- ITERATE over hash
  - for each k-v pair
    - multiply the k * v and append this value to a string
- COVNERT string to array where elements are formed by words between ' '
=end

def buy_fruit(fruits)
  fruit_list = ''
  fruits.to_h.map { |fruit, amount| fruit_list << "#{fruit} " * amount }
  fruit_list.split(' ')
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]