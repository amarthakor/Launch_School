=begin

Write a method that takes a string as an argument, and returns an Array that
 contains every word from the string, to which you have appended a space and
the word length.

You may assume that words in the string are separated by exactly one space, 
and that any substring of non-space characters is a word.

Examples
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []


--- P
- Given: String
- RETURN: array of string objects
        - each word from our orginal string becomes an element (string object)
        - but we also add a spce and the word length to each element

- word is any collection of chars that is not a whitespace
- words are separated from the length by exactly one space

--- E
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
  - 'cow' length = 3
  - 'sheep' length = 5
  - 'chicken' length = 7
--- D
beginning: string
intermediate: array to allow modification to each element by some factor
end: array 

--- A
- CONVERTA SRTING TO ARRAY OF WORDS
- TRANSFORM each element in array of words where
  - for each element
    - word + " #{word.length}"

=end

def word_lengths(string)
  string.split.map { |word| word + " #{word.length}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []