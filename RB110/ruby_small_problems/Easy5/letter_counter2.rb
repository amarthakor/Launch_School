=begin
Modify the word_sizes method from the previous exercise to exclude 
non-letters when determining word size. For instance, the length 
of "it's" is 3, not 4.

Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

--- P
- given: string
- return: hash where KV pairs are
          - keys are the integer size of a string
          - values are how many occurrences of a size appear in the given string
          - do not include punctuation such as commas, hyphens, etc.
          - if givecn string is empty, return empty hash
- assume argument will always be string
--- E
- word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
            4-letter word: 1, 3-letter word: 1, 5-letter word: 2

--- D
begin: string
middle: use hash to create KV pairs, most likely use array to perform transofrmation 
        and/or count sizes of each word 
end: hash

--- A
- RETURN empty hash if given string is empty
- CREATE a results hash
- CREATE array of keys for hash, keys are uniq sizes of words in string
  - ITERATE over an array of words
    - for each word
      - find the size of each word but only count alphabetical letters
- CREATE initial KV pairs
  - for each integer in the keys_array ( remember no duplicates )
    - create a kv pair where the integer of the wird size represents the key
    - the value is 0
- UPDATE all values in results hash
  - ITERATE over an array of every word transformed into its size
    - every time the size is equal to the key, increment value by + 1
- RETURN results hash
=end

def word_sizes(string)
  return {} if string.empty?
  results = {}
  alpha_chars = 'abcdefghijklmnopqrstuvwxyz'
  word_size_arr = string.split.map { |word| word.downcase.count(alpha_chars) }

  word_size_arr.uniq.each { |key| results[key] = 0 }
  word_size_arr.each { |key| results[key] += 1 }
  results
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}