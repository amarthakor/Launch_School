# Write a method that takes a string with one or more space separated 
# words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.
=begin
--- P
- Write a method that takes a string argumenet of word(s) and return a hash
- that shows the number of words of different sizes. 
    - the number of words will be represented as the Key
    - the size of the word will be represented as the Value
    "hi dog bit my tongue" => {2 => 2, 2 => 3, 1 => 6}

    - Separate words by spaces (#split?)
    - Count characters of each word (#size, #length, #count?)
    - set as hash KV pair (reassignment w/ hash syntax?)
    - Return hash

--- E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
- 'four' = 4, score = 5, and = 3, seven = 6 => { 3 => 1, 4 => 1, 5 => 1, 6 => 1}
--- D
- utilize hash to fulfill problem requirements
- use array object to iterate over collection of words

--- A
- Convert string into array of word-based elements
- Iterate over array where for each collection, 
  - for each word, t


=end