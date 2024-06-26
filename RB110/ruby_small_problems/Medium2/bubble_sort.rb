=begin
Bubble Sort is one of the simplest sorting algorithms available. 
It isn't an efficient algorithm, but it's a great exercise for 
student developers. In this exercise, you will write a method 
that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through 
the Array. On each pass, each pair of consecutive elements is 
compared. If the first of the two elements is greater than the 
second, then the two elements are swapped. This process is 
repeated until a complete pass is made without performing 
any swaps; at that point, the Array is completely sorted.


Write a method that takes an Array as an argument, and sorts that 
Array using the bubble sort algorithm as just described. Note that 
your sort will be "in-place"; that is, you will mutate the Array 
passed as an argument. You may assume that the Array contains at 
least 2 elements.


EXAMPLES:
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

Problem: Given an array of objects, return the array sorted from least -> greatest

Rules:
- Array contains at least 2 elements
- Mutate the array
- sort the array until no more swaps are made
- sort from least to greatest


Algorithm:
- SET a position counter to 0
- LOOP over given array where
  - while the position counter is less than the size of the array
    - if index is 0 OR the current element is greater than or equal to the previous element
      - increment position by += 1
    - else
      - swap the current element with the previous element
      - decrement position by -= 1

=end

def bubble_sort!(array)
  position = 0
  while position <= array.size - 1
    if position == 0 || array[position] >= array[position - 1]
      position += 1
    else
      array[position], array[position - 1] = array[position - 1], array[position]
      position -= 1
    end
  end
  array
end


p bubble_sort!([5, 3])  == [3, 5]
p bubble_sort!([6, 2, 7, 1, 4])  == [1, 2, 4, 6, 7]
p bubble_sort!(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))  == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)