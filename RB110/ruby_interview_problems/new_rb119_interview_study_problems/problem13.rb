=begin
Create a method that takes two strings as arguments and returns true if 
some portion of the characters in the first string can be rearranged to 
match the characters in the second. Otherwise, the method should return 
false.

You may assume that both string arguments only contain lowercase alphabetic 
characters. Neither string will be empty.

Examples:
p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

Problem: Given 2 string arguments, return true or false

Rules:
- To return true, the first string must be rearranglebale to form the second string
- If the above condition is not me,t return false
- Neighter string will be empty
- Both arg will only contain lowercase alphabetical chars

- Can letters be used more than once to form string 2?
  - assume no, come up with solutions for both cases

Algorithm:
- CONVERT string2 into an array of chars
- ITERATE/TRANSOFRM over each char
  - for each char
    - check if that char is found within string 1 and the count of chars is the same
      - return true if above is true
    - otherwise return false
- CHECK if entire array is all true

=end

def unscramble(str1, str2)
  str2.chars.map do |char|
    str1.include?(char) && str1.count(char) == str2.count(char)
  end.all?
end




p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true