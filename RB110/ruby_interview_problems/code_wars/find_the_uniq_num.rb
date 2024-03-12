=begin
There is an array with some numbers. All numbers are equal except for one.
Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

--- P
- given: array of integers
- return: the element that is unlike the rest

- all numbers are the same and appear multiple times except for ONE
  - this one unlike number appears only once
- array will contain at least 3 integers
- think about performance
--- E
- [1 1 1 2 1 1]
  - all elements are equal except 2
  -> 2

- [0 0 0.55 0 0]
  - all element are equal to 0 except 0.55
  -> 0.55
--- D
- array of itnegers
- maintain array to compare values and select specific element
- integer

--- A
- ITERATE over array
  - for each element
    - if the elements count appears only once
      - return that element

=end

def find_uniq(array)
  array.each { |num| return num if array.count(num) == 1 }
      #second solution
  # array.sort_by { |num| array.count(num) }.first
      #third solution
  # array.delete_if { |num| array.count(num) > 1 }.first
end



p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
p find_uniq([1,1,1,1,0]) == 0