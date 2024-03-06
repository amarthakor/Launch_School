=begin
Complete the solution so that it returns the number of times the search_text 
is found within the full_text. Overlap is not permitted : "aaa" contains 1 
instance of "aa", not 2.

Usage example:
full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
    ---> should return 2 since "bb" shows up twice


full_text = "aaabbbcccc", search_text = "bbb"
    ---> should return 1


--- P
- GIVEN: two strings, one whole string, one target substring
- RETURN: integer
        - integer should represent the amount of times substring appears in whole string
        - overlapping chars does not count as multiple instances 

--- E
- 'aa_bb_cc_dd_bb_e_b' -> 2
    - 'bb' is target substring
    - 'bb' appears twice in full string
      - 'b' is not valid since only one 'b' and not two
    - thereofre we return the count of 'bb's appeareances, 2 times total
--- D
begin: two strings
mid: array to create all possible instances ov target substring and count total appeareances
end: integer

--- A
- CREATE an array of all possible substrings
- COUNT how many times the target substring appears in the array of possible substrings
- RETURN the count

=end

def find_substr_count(word, chars)
  substrings = find_substrings(word)
  substrings.count(chars)
end

def find_substrings(string)
  substrings = []
  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
      substrings << string[start_idx..end_idx]
    end
  end
  substrings
end

p find_substr_count('abcdeb', 'b')  == 2
p find_substr_count('abcdeb', 'a')  == 1
p find_substr_count('abbc', 'bb')  == 1