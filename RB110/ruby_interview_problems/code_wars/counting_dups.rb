=begin
Write a function that will return the count of distinct case-insensitive 
alphabetic characters and numeric digits that occur more than once in the 
input string. The input string can be assumed to contain only alphabets 
(both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

--- P
- given: string
- return: return the amount of chars that have more than 1 appearance

- case does not matter
- only string argument, no other objects
- return integer
- only count once if a character has more than 1 appearance
  - do not count total times the character appears
--- E
- "abcde"
  - 'a', 'b', 'c', 'd', 'e' all occur once, therefore count is 0

- 'aA11' 
  - 'a' appears twice (case doesn't matter)
  - '1' appears twice
  - thus count both chars and return 2

- "indivisibility"
  - 'i' appears 6 times, therefore we return 1 since 'i' is the only char that appears
  more than once

--- D
begin: string
mid:  array to eval each char or perhaps string method to analyze each char
end: integer

--- A
- INITIALIZE a variable to represent the total chars that appear > 1
- CONVERT the string to an array
- ITERATE over the array to see if chars appear more than once
  - during iteration, remove all duplicate chars
  - for each char
    - if the number of appearances is more than 1
      - increment total_chars variable by +1
- RETURN total chars variable

=end

def duplicate_count(string)
  total_dupes = 0
  string = string.downcase
  string.chars.uniq.each { |letter| total_dupes += 1 if string.count(letter) > 1 }
  total_dupes
end

p duplicate_count("abcde")  == 0
p duplicate_count("aabbcde")  == 2  # 'a' and 'b'
p duplicate_count("aabBcde")  == 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
p duplicate_count("indivisibility")  == 1 # 'i' occurs six times
p duplicate_count("Indivisibilities")  == 2 # 'i' occurs seven times and 's' occurs twice
p duplicate_count("aA11")  == 2 # 'a' and '1'
p duplicate_count("ABBA")  == 2 # 'A' and 'B' each occur twice
