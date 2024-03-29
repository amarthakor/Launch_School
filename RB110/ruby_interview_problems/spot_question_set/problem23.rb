=begin

Find the longest substring in alphabetical order.
Example: 
the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code
 will need to be efficient.
The input will only consist of lowercase characters and will be at 
least one letter long.
If there are multiple solutions, return the one that appears first.


problem: given a string, return a substring

Rules:
- return substring should be the longest substring in alphabetical order
- only lowercase chars
- If there are multiple substrings, return the solution that appears first

Algorithm:
- CREATE an array of the lowercase alphabet
- CREATE all substrings of 1 char or longer
- SELECT all substrings that are in alphabetical order
  - for each subarray
    - if the subarray is equal to the subarray sorted
      - select it
- FIND the largest substring size out of the alphabetical substrings
- CREATE an array of all alphabeta substr that are max size
- RETURN the first substr in the max size array

=end

def longest(string)

  substrings = find_substrings(string)
  alpha_subs = find_alpha_subs(substrings)

  max_sub_length = alpha_subs.map { |word| word.size }.max
  max_length_subs = find_max_length_subs(alpha_subs, max_sub_length)

  max_length_subs.first
end

def find_substrings(string)
  array = []
  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      array << string[start_idx..end_idx]
    end
  end
  array
end

def find_alpha_subs(strings)
  alpha_subs = []
  strings.each { |substr| alpha_subs << substr if substr.chars == substr.chars.sort }
  alpha_subs
end

def find_max_length_subs(strings, max_length)
  max_subs = []
  strings.each { |substr| max_subs << substr if substr.size == max_length }
  max_subs
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'