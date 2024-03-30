=begin
Given a string, return a new string that has transformed based on the input:
Change case of every character, ie. lower case to upper case, upper case
to lower case.

Reverse the order of words from the input.

Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:
"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

Problem: Given a string, return a new

Rules:
- Return a new string
- TRANSFORMING input string
  - change case of every letter to opposite case

- ALSO reverse the order of words from the given input
- INPUT will only be enlgish lietters and spaces

Algorithm:
- ITERATE over an array of words
  - for each word
    - iterate over every char
      - for each char
      - if the char is upcase
        - downcase it
      - otherwise
        - upcase it

- REVERSE the array of words
- JOIN the array of words
=end

def string_transformer(string)
  string.split.map do |word|
    word.chars.map { |char| char == char.upcase ? char.downcase : char.upcase }.join
  end.reverse.join(' ')
end

p string_transformer("Example Input") == "iNPUT eXAMPLE"