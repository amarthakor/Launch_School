=begin

Write a method that counts the number of occurrences of each
element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted,
print each element alongside the number of occurrences.

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2

--------------------
---- P
- GIVEN: array of string objects representing types of vehicles
- RETURN: the type of car with the amount of times it appears in the argument array

- array is CASE- sensitive
---- E
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
output
- car -> 4
- truck -> 3
- SUV -> 1
- motorcycle -> 2

---- D
beginning: given array of strings
intermediate: use array to iterate over given array, transition to hash
ending: return value is a hash


---- A
- CREATE a hash of vehicles as keys and their values as 0
- ITERATE over array where
  - for each element
    -increment the value by +1 for the key that has the same name as the current element
- RETURN HASH



=end
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


def count_occurrences(array)
  car_hash = { }

  array.each { |car| car_hash[car] = array.count(car) }

  car_hash.each { |k, v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)