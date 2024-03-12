=begin
You are going to be given an array of integers. Your job is to take that 
array and find an index N where the sum of the integers to the left of N 
is equal to the sum of the integers to the right of N. If there is no 
index that would make this happen, return -1.

EX:
- [1,2,3,4,3,2,1] == (index) 3
- [1,100,50,-51,1,1] == index 1
- [20,10,-80,10,10,15,35] == index 0

--- P
  - given: array of integers
  - RETIURN: single integer
        - represents an index number of the array where
          - the sum of integers to the left of index N
          - and the sum of integers to the right of index N are equal
          - if there is no integer that would make this happen
            - return 01

- empty arrays are equal to 0 in this problem
--- E
- [1,2,3,4,3,2,1] -> index 3 integer 4
  - [1, 2, 3 |4| 3, 2, 1]
  - [6, |4|, 6]
  - |4| is the midpoint where the sum of the left and the right are ==

- [1,100,50,-51,1,1] -> index 1, integer 100
  -[1 |100| 50 -51 1 1]
  - [1  |100| 1]
  - |100|, index 1, is the midpoint where the sum of the left and right are ==

- [20,10,-80,10,10,15,35] -> index 0, integer 20
  - [|20|, 10 -80 10 10 15 35]
  - [empty array |20| 0]
  - empty array is equal to 0 in this problem
  - thus index 0, integer 20, is the midpoint where the sum of the left and right 
    are ==




--- D
- begin: array of integers
- intermed: maintain array structure to help find sums and select an idx value
- end: return index vlaue

--- A
- for each element in my given array
  - i want to find the sum of all elements to the left and the right of the current idx
  - then compare those two sums
    - if the sums are equal, select the current index
  - if the sums are not equal, move onto the next element
- RETURN -1 if there is no index value where the sum of the left and right
  elements are equal to each other

=end

def find_even_index(arr)
  arr.each_with_index do |num, idx|
    if idx == 0 && (0 == arr[idx + 1..-1].sum)
      return 0
    elsif (arr[0..idx - 1].sum) == (arr[idx + 1..-1].sum)
      return idx
    elsif (idx == arr.size - 1)
      return -1
    end
  end
end



p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index(Array(-100..-1)) == -1