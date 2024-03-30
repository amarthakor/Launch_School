=begin
Assume "#" is like a backspace in string. This means that
 string "a#bc#d" actually is "bd"
Your task is to process a string with "#" symbols.

Examples
"abc#d##c" ==> "ac"
"abc##d######" ==> ""
"#######" ==> ""
"" ==> ""

Problem: Given a string, return a string

Rules:
- Given string will contain '#' characters
- '#' means backspace
- Anytime a '#' is found, the previous character should be removed


Algorithm:
- CONVERT the stirng into an array of chars
- ITERATE over each char/index
  - for each char/index
    - if the current char is a #
      - delete the previous index
- JOIN the array

=end

def clean_string(string)
  results = []

  string.chars.each_with_index do |char, idx|
    results << char unless char == '#'
    results.pop if char == '#'
  end

  results.join
end


p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""