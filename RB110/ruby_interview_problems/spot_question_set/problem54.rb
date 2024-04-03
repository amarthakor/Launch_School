=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string,
 and returns the same string with all even
indexed characters in each word upper cased, and all odd indexed 
characters in each word lower cased. The indexing
just explained is zero based, so the zero-ith index is even, 
therefore that character should be upper cased.
The passed in string will only consist of alphabetical characters 
and spaces(' '). Spaces will only be present if there are
multiple words. Words will be separated by a single space(' ').


Problem: Given a string, return the same string w/ all even index chars
          uppercased and all odd indexed chars lowercased

Rules:
- RETURN SAME string (not new string)
- MODIFY chars
  - even index will be uppercased
  - od index will be lowercased
- 0 based indexing, 0 is even, 1 is odd, etc..
- String arg will only be alphabetical chars and spaces
- Spaces only present if multiple words, single space separates words
- if empty string given, return empty stirng?
- index counter resets for each word

Algorithm:
- CREATE duplicate string
- Create index and set to 0
- ITERATE over array of words of dup string
  - for each word
    - ITERATE over chars and index
      - for each char
        - if index is even, upcase char at index_var position
        - otherwise index is odd, downcase char at index_var position
        - increment index var by +=1
    - increment indexvar by +=1 to account for space
=end

def weirdcase(string)
  copy_str = string.dup
  index = 0

  # allows us to mutate original string by iterating over dup copy
  copy_str.split.map do |word|
    word.chars.map.with_index do |char, idx|
      string[index] = char.upcase if idx.even?
      string[index] = char.downcase if idx.odd?
      index += 1
    end
    index +=1
  end

  string
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"