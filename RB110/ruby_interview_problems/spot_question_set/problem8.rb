=begin
For a given nonempty string s find a minimum substring t and the maximum number
k, such that the entire string s is equal to t repeated k times. The input 
string consists of lowercase latin letters. Your function should return 
an array

Example 1:
s = "ababab" -> ["ab", 3]

Example 2:
s = "abcde" -> ['abcde', 1]


Problem: Given a string, return an array of a substring and integer

Rules:
- Return array consists of two objects, a substirng and integer, where
  - the substring is the smallest possible substring such that multiplied
    by the integer, it will equal the given string
- If there are no substrings that can form the given string,
  the return array will consist of the string itself and the integer 1, 
  as 'string' x 1 = 'string'

- Input will contain lowercase chars only


Algorithm:
- CREATE a results array
- CREATE all substrings of the given string from index 0 to last index only
- ITERATE over substrings
  - for each substring
    - multiply the substring by multiple integers from 1..string size
    - if one of these values is equal to the string
      - append the [substring, integer] to the results array
    - otherwise moveonto the next substirng or end iteration
- SELECT the subarray with the smallest subarray
=end

def f(word)
  substr = []

  word.size.times { |idx| substr << word[0..idx] }

  substr.each do |subs|
    1.upto(word.size) do |factor|
      return [subs, factor] if subs * factor == word
    end
  end
end


p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]