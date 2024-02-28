=begin
Write a method that takes one argument, a string, and returns a new string
with the words in reverse order.

Examples:
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

--- P
- GIVEN: string
- RETURN: string where
        - order of words are reversed
- if string is empty, return empty string
- if only whitespace is given, return empty string

--- E
input: reverse these words
output: words these reverse

--- D
beginning: string
intermediate: array to modify each word easily
end: string

--- A
- CONVERT string into array of words
- TRANSFORM array of words into reverse order
- CONVERT array of words back into a string

=end

def reverse_sentence(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''