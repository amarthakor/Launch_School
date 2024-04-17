=begin
Write a function called longestConsecutiveAscendingWords that 
takes a sentence as input and finds all consecutive word  where the succeeding 
word is longer than the previous. The function should return an array of 
these pairs. Punctuation marks should be considered part of a word 
(e.g., "hello," and "hello" are different words). - Udeshika
=end 

# Test cases
puts longest_consecutive_ascending_words("The quick brown fox jumps over the lazy dog").inspect # [ 'The', 'quick' ]
puts longest_consecutive_ascending_words("A journey of a thousand miles begins with a single step").inspect # [ 'A', 'journey' ]
puts longest_consecutive_ascending_words("Easy come easy go").inspect # [ 'Easy' ]
puts longest_consecutive_ascending_words("Tiny bird flew over the peaceful countryside").inspect # [ 'the', 'peaceful', 'countryside' ]