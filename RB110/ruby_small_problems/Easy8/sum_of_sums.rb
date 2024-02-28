=begin
Write a method that takes an Array of numbers and then returns the sum
 of the sums of each leading subsequence for that Array. You may assume
that the Array always contains at least one number.

Examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35


--- P
- GIVEN: array of integers
- RETURN: SUM of sums, where
        - sums are composed of elements starting at the first element upto the entire array
        
- array will always contain at least 1 integer
- assume array will alawys contain integers
--- E
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)


--- D
beginning: array of integers
interemdiate: maintaina array to iterate over entire array to find all possible
sum combininations
end: integers

--- A
- FIND all possible sum combinations
- SUM all possible sum combinations
- RETURN the sum

=end

def sum_of_sums(array)
  iterations = array.size
  results = 0
  iterations.times do |num|
    results += array[0..num].sum
  end
  results
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35