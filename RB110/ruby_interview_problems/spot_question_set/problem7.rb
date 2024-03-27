=begin
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word 
which should be returned as a string, where n is the position of the word
in the list.

For example:
["yoda", "best", "has"] --> "yes"
  ^        ^        ^
n=0 n=1 n=2

Note: Test cases contain valid input only - i.e. a string array or an empty array; 
and each word will have enough letters.

Problem: Given an array of 'words' return a string

Rules:
- Return string is composed of chars from given array such that
  - Starting at the first index for the first wonder, select that char
  - Move to the next index and choose the next char
  - so on and so forth over the entire array
  - Finally return the new string from chars of each given array of words

- Return string length will == given array size
- If arrayis empty return empty string
- Keep the case the same for all chars
- EACH word will have enough letters so no need to worry about nil indexes

Algorithm:
- CREATE a empty string that will be used to form new string
- ITERATE over given array
  - For each word
    - REASSIGN the results string to the character in the current word at the given idx
- RETURN the results string

=end

def nth_char(words)
  answer = ''
  words.each_with_index { |word, idx| answer += word[idx] }
  answer
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'