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

- if string is empty return empty hash
--- E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  - 4letter word: 1, 5-letter word: 1 , 3-letter word: 1, 6-letter word: 1

word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

--- D
begin: string
middle: hash to represent KV pairs and perhaps array to set keys or find counts
end: hash

--- A
- RETURN empty hash if given string is empty
- INITIALIZE results hash
- CREATE hash keys and set them to 0
  - create array of all words transformed to word sizes integers
  - find keys by finding the sizes of each word and removing duplicates
  - set values to 0 for all keys
- SET values for each KV pair 
  - ITERATE through array of word counts
    - for each integer key
      - increment the value by +1


=end

def word_sizes(string)
return {} if string.empty?
results = {}

word_counts = string.split.map { |word| word.length }
word_counts.uniq.each { |key| results[key] = 0 }
word_counts.each { |key| results[key] += 1}

results
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}