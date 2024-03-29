=begin
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of
characters then it should replace the missing second character of the final pair 
with an underscore ('_').

Problem: Given a string, return an array

Rules:
- Given a string
- Return an array of substrings 2 chars in length
- If the last substring is only 1 char long, the missing 2nd char should be an '_'
- If given string is empty, return an empty array

Algorithm:
- RETURN empty array if given arugment is empty string
- CREATE an empty array
- FIND all substrings that are 2 chars in length maximum
  - substrings should be in order and not overlap characters
    - 01, 23, 45 == acceptable, 01, 12, 23 == unacceptable
- ALL 2char long (or 1char if found) should be moved to an array
- CHECK the array to makesure all subs are 2chars long
  - If the last one is 1char long, add an  '_' to it
- RETURN modiefied array
=end

def solution(string)
  return [] if string.empty?
  substrings = []
  0.upto(string.size - 1) do |idx|
    substrings << string[idx] if idx.even? && idx == string.size - 1
    break if string[idx + 1] == nil
    substrings << string[idx] + string[idx + 1] if idx.even?
  end
  substrings.map { |substr| substr.size == 2 ? substr : substr << '_' }
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []