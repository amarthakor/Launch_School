=begin
# #  Write a function that returns the count of triple of numbers that have 
2 odd numbers and 1 even. If there’s none return -1. All numbers in the array 
will be integers greater than 0


# # # Test cases
# puts count_triples([1, 2, 3, 4]) # Expected output: 2
# puts count_triples([2, 4, 6, 8]) # Expected output: -1
# puts count_triples([1, 3, 5, 7]) # Expected output: -1
# puts count_triples([1, 2, 3, 4, 5, 6]) # Expected output: 9
--- P
- given: array of integer
- return: integer where;
          - integer represents the count of three numbers that have 2 odds and 1 even
          - if there are no tripllets that have 2 odds, 1 even, return -1
          - all numbers in array will be > 0
- how do i make a triple?
    - not sure how to make a triple
--- E
- count_triples([1, 2, 3, 4]) # Expected output: 2
  - count all triplets that have 2 odd 1 even
    

- count_triples([1, 2, 3, 4, 5, 6]) # Expected output: 9
  - 

--- D

--- A


=end

def count_triples(array)

end

p count_triples([1, 2, 3, 4]) # Expected output: 2
# p count_triples([2, 4, 6, 8]) # Expected output: -1
# p count_triples([1, 3, 5, 7]) # Expected output: -1
# p count_triples([1, 2, 3, 4, 5, 6]) # Expected output: 9