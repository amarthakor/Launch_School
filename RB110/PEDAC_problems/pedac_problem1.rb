=begin
Consider the word "abode".
The letter `a` is in position 1 and `b` is in position 2.
In the alphabet, `a` and `b` are also in positions 1 and 2.

The letters `d` and `e` in "abode" occupy the positions they would occupy in the 
alphabet, which are positions 4 and 5. 

Given an array of words, return an array of the number of letters that occupy their 
positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) == [4, 3, 1]

Input will consist of alphabetic characters, both uppercase and lowercase.  No spaces.

solve(["abode","ABc","xyzD"]) == [4,3,1]
solve(["abide","ABc","xyz"])  == [4,3,0]
solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
=end
# P
# - Identify all characters within the string wherein their index value also matches their position within the alphabet
# - Input: array of multiple string arguments
# - output: array of integers
# - Rules:
#   case does not matter
#   assume that only strings of alphabetic charcs will be provided
# E
# solve(["abode","ABc","xyzD"]) == [4,3,1]
#
# D
# input: an array of strings of mixed case alph chars
# output: an array of integers
#
# A
# create empty array that will store number values
# lowercase all string arguments
# create an array with elements string values of the alphabet
# for each word in our test case
  # set a counter equal to 0
  # compare the argued charc, at a specific idx, to the alphabet charc at the provided idx
    # if the argued charc is equal to the alphabet charc at the same indices
      # increment counter by +1
  # append the counter to our results array
# last evaluated line should be our results array

def solve(words)
  position_results = []
  alphabet = ('a'..'z').to_a

  words = words.map { |str| str.downcase }
  
  words.each do |word|
    counter = 0
    word.split('').each_with_index do |letter, idx|
      if alphabet[idx] == letter
        counter += 1
      end
    end
    position_results << counter
  end
  position_results
end

puts solve(["abode","ABc","xyzD"])  == [4,3,1]
puts solve(["abide","ABc","xyz"])  == [4,3,0]
puts solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
puts solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]