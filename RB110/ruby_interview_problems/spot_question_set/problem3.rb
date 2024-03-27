=begin
Return substring instance count
Complete the solution so that it returns the number of times the search_text 
is found within the full_text.

Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

Problem: given two string arguments, return an integer

Rules:
- First string arugment is the entire text
- Second string arg is a substring
- Return integer counts the occurrenes of the substring within the full string

Algorithm:
- CREATE an array of all possible substrings
- ITERATE over array of substrings and select the substring if it 
  is equal to the target substring
- RETURN the count of the selected array
=end


def solution(string, target)
  substr = []

  string.size.times do |start_idx|
    start_idx.upto(string.size - 1) do |end_idx|
       substr << string[start_idx..end_idx]
    end
  end

  substr.select { |subs| subs == target }.count

end


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
p solution('abcdeb', 'bd') == 0