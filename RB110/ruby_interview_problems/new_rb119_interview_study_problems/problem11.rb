=begin
Create a method that takes a nonempty string as an argument and returns an 
array consisting of a string and an integer. If we call the string argument s, 
the string component of the returned array t, and the integer component of the 
returned array k, then s, t, and k must be related to each other such that 
s == t * k. The values of t and k should be the shortest possible substring and 
the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic 
letters.

Examples:
p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

2:25

Problem: Given a non empty string, return an array with two elements, a string and integer

Rules:
Variable relationships:
s (whole string) == t (shortest substring) * k (times repeated)
  - 's' defines the given whole string
  - 't' defines the shortest substring that can be repeated to form the whole string
  - 'k' defines the number of times 't' has to be repeated to form 's' (the entire string)
- All arguments will consist of lowercase alpha chars
- Given a string, find the smallest substring that can be repeated x amount of times
to form the whole string, then return that shortest substring and integer count in an array

Examples:
'superduper' == [;superduper;, 1]
  - if there are no substrings that can repeat to form the string, the shortest substring
    is the string itself

Algorithm:
- CREATE a results array
- FIND the length of the given string
- CREATE all substrings of the string for only the first character
- MULTIPLY each substring by 1 upto the string size
  - APPEND any sunstring + integer that is equal to the string
- SELECT the integer wiht the shortest substring
=end

def repeated_substring(string)
  results = []
  substrings = []

  0.upto(string.size - 1) { |end_idx| substrings << string[0..end_idx] }
  factors = (1..string.size).to_a
 
  string.size.times do |start_idx|
    1.upto(string.size) do |multiplyer|
      if substrings[start_idx] * multiplyer == string
        results << [substrings[start_idx], multiplyer]
      end
    end
  end

  results.first
end



p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
