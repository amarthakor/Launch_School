=begin
Write a method that takes a single String argument and returns a new
string that contains the original value of the argument with the first
character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

--- P
- Given: string argument
- RETURN: string argument with each word capitalized
- first char in word must be capitalized
  - "char" => 'Char'
- if first char is not alphabetical, no need to do anything
  -'+quote+' => '+quote+''
- a 'word' is chars separated by whitespace
  - 'cheesecake for dinner?' -> 'Cheesecake For Dinner?'
- what happens if string argument is empty?
 - assume string  will have words
- what happens if non string argument is provided?
  - at this time assume only string argument is provided
- What happens if word has a capital letter thats not the first char of the word?
  - transform the word so all are lowercase EXCEPT the first char
--- E
word_cap('four score and seven') == 'Four Score And Seven'
  - each "word" separated by whitespace = four, score, and, seven
  - capitalize each word = Four, Score, And, Seven
word_cap('the javaScript language') == 'The Javascript Language'
  - 'javaScript' -> 'Javascript'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
  - "quoted" first char is ", therefore we dont do anything

--- D
beginning: string
intermediate: array would allow easy iteration over each "word" char and allow separation of string
ending: string

--- A
- CREATE an array of 'words'
- TRANSFORM the words to be capitalized
- CONVERT back into a string
- RETURN the string

=end

def word_cap(str)
  str.split.map do |word|
    word.capitalize
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'