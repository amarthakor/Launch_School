=begin

In this kata, you've to count lowercase letters in a given string and return 
the letter count in a hash with 'letter' as key
and count as 'value'. The key must be 'symbol' instead of string in Ruby

Problem: Given a stirng, return a hash

Rules:
- Keys are constructed of lowercase alpha chars
- Values are the count of the the key(char) in the string
- Keys must be symbols not string chars


Algorithm:
- CREATE empty results hash
- ITERATE over uniq array of chars
  - for each char
    - create a KV pair in results
      - key is the char.to_sym
      - value is set to the count of char in the original string
- RETURN hash

=end

def letter_count(string)
  results = {}
  string.chars.uniq.each { |char| results[char.to_sym] = string.count(char) }
  results
end


p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}