=begin
Write a method that returns a list of all substrings of a string that are palindromic. 
That is, each substring must consist of the same sequence of characters forwards as 
it does backwards. The return value should be arranged in the same sequence as the 
substrings appear in the string. Duplicate palindromes should be included multiple 
times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay 
attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor 
"Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

--- P
- given: stirng
- return: all substrings that are palindromic
        - palindromic substrings are strings that are the same forwards and reversed
        - substrings must be at least 2 chars long
        - CASE matters
        - duplicates should be included
--- E
- palindromes('madam') == ['madam', 'ada']
  - ma, mad, mada, madam
  - ad, ada, adam
  - da, dam
  - am

--- D
beginningL: string
middle: array to iterate over strings and select all palindromes
end: array

--- A
- return an empty array if given string is empty
- CREATE a results array
- FIND all substrings of length 2 or greater
  - 1.upto(array.size-1 ) for end index
- SELECT all PALINDROMIC substrings
  - stirng = string.reverse
- RETURN the results array

=end

def palindromes(string)
  results = []

  string.size.times do |start_idx|
    (start_idx + 1).upto(string.size - 1) do |end_idx|
      results << string[start_idx..end_idx]
    end
  end

  results.select { |substr| substr == substr.reverse}
end
p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]