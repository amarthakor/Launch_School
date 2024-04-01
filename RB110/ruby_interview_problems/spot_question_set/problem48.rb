=begin
Mothers arranged a dance party for the children in school. 
At that party, there are only mothers and their children. All
are having great fun on the dance floor when suddenly all the lights went
 out. It's a dark night and no one can see each
other. But you were flying nearby and you can see in the dark and have 
ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. 
"A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.

Task:
Place all people in alphabetical order where Mothers are followed by their 
children, i.e. "aAbaBb" => "AaaBbb".

Problem: Given a string, return a string

Rules:
- If the string is empty, return an empty string
- Given string contains only alphabetical chars, upper or lower case
- All upcase strings are unique
- PAIR same chars together
  - i.e., Aa Gggg Bbb
- Return string should have 'mothers', upcase letters, followed by lowercase letters
  -'SAGsmnfksaaaabejl'
  -"Aaaaa..."

Algorithm:
- RETURN empty string if given string is empty
- CONVERT string into array of chars
- SORT array of chars
  - downcase all chars
- CREATE compairson array
- ITERATE over array of chars
  - check an array of current chars
    - if the array doesn't have the current char
      - append it to current chars array
      - UIPCASE it
    - otherwise move onto the next char
- JOIN array of chars

=end

def find_children(string)
  string = string.downcase.chars.sort
  chars = []

  string.map do |char|
    if !chars.include?(char)
      chars << char
      char.upcase
    else
      char
    end
  end.join
end


p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""