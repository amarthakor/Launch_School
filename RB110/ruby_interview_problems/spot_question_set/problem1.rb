=begin
In this kata, you've to count lowercase letters in a given string and return 
the letter count in a hash with 'letter' as key
and count as 'value'. The key must be 'symbol' instead of string in Ruby 
and 'char' instead of string in Crystal.

Example:
letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}



Problem: Given a string, return a hash

Rules:
- Return hash has KV pairs where
  - Keys are unique lowercase letters
  - Values are integer counts of the lowercase letters in given string

- Key must be a symbol instead of string

Algorithm:
- CREATE an empty results hash
- CONVERT the string into an array of unique characters
- ITERATE over the array
  - for each uniq char
  - convert the char to a string and create a KV pair within the results hash
    - where the key is a symbol of the current char
    - the value is 0
- ITERATE over the results hash
  - for each key-value pair
  -  reassign the value to the count of the corrsponding key in the given string
=end

def letter_count(str)
  results = {}

  str.downcase.chars.uniq.map {|char| results[char.to_sym] = str.count(char)}

  results
end











p letter_count('codewars') == ({:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == ({:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})