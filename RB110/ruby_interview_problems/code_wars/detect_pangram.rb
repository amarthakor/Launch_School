=begin
A pangram is a sentence that contains every letter of the alphabet at least once.

EX.
"The quick brown fox jumps over the lazy dog" is a pangram, because all 26
letters of the alphabet appear at least once in the sentence

Given a string, detect whether or not it is a pangram.
Return TRUE if it is a pangram
RETURN FALSE if it is not a pangram
Ignore numbers and punctuation


--- P
- GIVEN: a string
- RETURN: TRUE or FALSE
        - RETURN TRUE if
        - all 26 letters of the alphabet are present in the string
        - case does not matter
        - punctuaiton/numbers do not matter
          otherwise return FALSE

--- E
- "The QUICK brown fox jumps over the lazy dog"
  - includes all 26 letters of alphabet from A-Z
    - returns TRUE

- "This is not a pangram"
  - missing several letters
  - return FALSE

--- D
-begin: string
-mid: array
-end: boolean

--- A
- CREATE an array of the alphabet
- TRAN
- CHECK every character in the alphabet to see if it appears in the given string
- return TRUE if all 26 letters are within the given string
- return FALSE otherwise

=end

def pangram(sentence)
  alphabet = ('a'..'z').to_a
  within_string = []
  alphabet.size.times do |letter|
    within_string << sentence.downcase.include?(alphabet[letter])
  end
  within_string.all?
end

p pangram("The quick brown fox jumps over the lazy dog.") == true
p pangram("This is not a pangram.") == false