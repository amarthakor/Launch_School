# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

=begin
--- P
- Write a method that takes an array of ints starting at 0 and ending at 19
  => Return an array of those numbers
      - sorted in alphabetical order based on english spelling

--- E
[0..19] == [8, 18, 11, 15... 0]

--- D
- use hash to create KV pairs of ints and their english spelling values

--- A
- Create a hash of integers and strings of their name in english
  - {0 => 'zero'... 19 => 'nineteen'}
- Create results array
  - initialize sorted_numbers array
- Create an array of all integers in the array given in their english name form
  - intialize array
    - given_numbers
  - iterate over given array and push in english spelling into our array
    - for each array, refernce the hash[integer] and push the value into our array
- Sort all the values(string names) by alphabetiacl order
  - select all the values from my hash
    - hash.values? => returns array
  - sort through the selected values
    - sort method? => hash.values.sort => sorted array
  - set these sorted values to a variable to reference these values
    - 'number_names' = hash.values.sort?
- Return a new array of integers based off the sorted values
  - iterate through 'number_names' where for each string name
    - push the respective key for this value into a new array
      - sorted_numbers << hash.key('number_names element')
=end
NUMBERS_HASH = {0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
18 => 'eighteen', 19 => 'nineteen'}

def alphabetic_number_sort(numbers)
  given_numbers_names = []

  numbers.each do |num|
    given_numbers_names << NUMBERS_HASH[num]
  end
  given_numbers_names = given_numbers_names.sort

  sorted_numbers = given_numbers_names.map do |names|
                    NUMBERS_HASH.key(names)
                   end

end

puts alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
  ]

puts alphabetic_number_sort((0..10).to_a) == [
  8, 5, 4, 9, 1, 7, 6, 10, 3, 2, 0
]