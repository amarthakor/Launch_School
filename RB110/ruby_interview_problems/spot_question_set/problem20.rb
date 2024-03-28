=begin
Write a method that takes a string as an argument and groups the number of 
times each character appears in the string
as a hash sorted by the highest number of occurrences.
The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, special characters and count uppercase letters as lowercase ones.


Problem: Given a string, return a hash

Rules:
- Hash consists of KV pairs where
  - keys are all integer values
  - values are an array of chars that appear key times in the given string
- Each value array should be sorted alphabetically
- IGNORE all chars except alphabetical chars
- Case does not matter, A == a

Algorithm:
- CREATE a results hash
- CREATE a keys array
- ITERATE over an array of unique characters
  - for each unique char
    - find the count of the char in the given string and append the count to the keys array
- ITERATE over all uniq values in the keys array
  - for each uniq value
    - create a KV pair where the current num is the key and the value is an empty array
- ITERATE over an array of unique chars
  - for each uniq char
    - find the count of the current char in the given string
    - append the current char into the KV pair that correspounds w/ the above count
- RETURN the hash
=end
ALPHA_NUM = 'abcdefghijklmnopqrstuvwxyz0123456789'

def get_char_count(string)
  string = string.downcase.chars.map { |x| x if ALPHA_NUM.include?(x) }.join

  results = {}

  string.chars.uniq.each { |char| results[string.count(char)] = [] }

  string.chars.uniq.each { |char| results[string.count(char)] << char }

  results = results.sort { |a, b| b <=> a }.to_h

  results.each { |k, v| results[k] = v.sort }

  results
end


p get_char_count('h') == {1=>['h']}
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}