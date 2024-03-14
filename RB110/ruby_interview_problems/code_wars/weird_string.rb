=begin
Write a function that accepts a string, and returns the same string with 
all even indexed characters in each word upper cased, and all odd 
indexed characters in each word lower cased. The indexing just explained 
is zero based, so the zero-ith index is even, therefore that character 
should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and 
spaces(' '). Spaces will only be present if there are multiple words. 
Words will be separated by a single space(' ').

Examples:
"String" => "StRiNg"
"Weird string case" => "WeIrD StRiNg CaSe"

--- P
- given: string
- return: modified string where;
        - even indexed chars in each word are upperchased
        - odd indexed chars in each word are lowercased
        - index values start at 0
        - 0 is considered even, so we upcase the start of each word
        - start over 0 index for each word
        - only provided alphabetical chars and spaces
        - a word is separated by a single space

- assume string will never be empty
- assume no other objects will be passed

--- E
- "String" == 'StRiNg'
  - even indexes are upcased -> S R N
  - odd indexes are downcased -> t i g
  -> StRiNg 

- "Weird string case" => "WeIrD StRiNg CaSe"
  - each word beginning will be 0 indexed
    - even index letters will be    W I D,      S R N,      C S
    - odd index letters will be     e r,        t i g,      a e
    -> WeIrD StRiNg CaSe 
--- D
- begin: string
- middle: use array to reset index for each new word and separate by spaces
- end: string

--- A
- CREATE an array of words, no spaces included
- TRANSFORM each word, where even idnexes are uppercased; odd indexes are lowercased
  - iterate over each word where;
    - for each char and its index in every word (nested loop)
      - if the index is evenly divisible by 2
        - upcase it
      - otherwise
        - downcase it
- JOIN the array into a string again separated by spaces

=end

def weirdcase(string)
  string.split.map do |word|
    word.chars.map.with_index do |char, idx|
      idx % 2 == 0 ? char.upcase : char.downcase
    end.join
  end.join(' ')
end

p weirdcase('String') # == 'StRiNg'
p weirdcase('Weird string case') # == "WeIrD StRiNg CaSe"