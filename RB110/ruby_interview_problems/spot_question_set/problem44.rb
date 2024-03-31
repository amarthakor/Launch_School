=begin
Count the number of Duplicates
Write a function that will return the count of distinct case-insensitive 
alphabetic characters and numeric digits that occur
more than once in the input string. The input string can be assumed to 
contain only alphabets (both uppercase and
lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice


Problem: Given a string, return an integer

Rules:
- Return integer represents the count of alphabetical chars that occur more than once
- CASE does not matter
- Include digits and letters
- INPUT will only contain digits + letters
- RETURN 0 if string is empty

Algorithm:
- CREATE an array of lowercase alpha +digits chars
- SET count to 0
- ITERATE over alpha+digit array
  - for each char
    - if the count of the current char in the given str is > 1
      - increment count by +=1
- RETURN the value of count

=end

CHARS = ('a'..'z').to_a + ('0'..'9').to_a

def duplicate_count(string)
  count = 0
  CHARS.each { |char| count += 1 if string.downcase.count(char) > 1 }
  count
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2