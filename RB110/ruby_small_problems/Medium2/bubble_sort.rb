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

--- P
- given: array of various elements
- return: return the original array sorted
        - mutate original array
        - array will contain at least 2 elements
        - create bubble sort method

- bubble sort works by making multiple iterations
- current ele is compared to next ele
- if current ele is > next ele
  - current ele and next ele flip positions
- this process repeats until a complete pass is made w/o performing any swaps

--- E
arr([5, 3]) -> [3, 5]

- [6, 1, 2, 4, 7] -> [1, 2, 4, 6, 7]

--- D
beginning: array of elements
middle: array to cotinue iterating over elements
end: mutated array

--- A


=end

def bubble_sort!(array)
  
end

# p bubble_sort!([5, 3]) # == [3, 5]
# p bubble_sort!([6, 2, 7, 1, 4]) # == [1, 2, 4, 6, 7]
p bubble_sort!(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) # == [Alice, Bonnie, Kim, Pete, Rachel, Sue, Tyler]