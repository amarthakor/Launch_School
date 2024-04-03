=begin
3:22
You are given a secret message you need to decipher. Here are the things 
you need to know to decipher it:

For each word:
the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces

Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'


Problem: Given a string, return a string

Rules:
- Given string is a message and needs to be deciphered somehow
  - For each word
    - Second and Last letter are swapped
    - First letter is replaced by its character code
- All input is only letters and spaces

- What is a character code?
  - Is it ASCII?
  - How do I obtain this value?
    -.ord?
  - IF it is ASCII, how long are the codes?
    - Are they one digit, two digit, three?


Algorithm:
- CONVERT string into array of words
- TRANSFORM array of words where
    - for each word
      - set a var to the 2nd letter, set a var to the last letter
      - reassign the 2nd char and last char to the last letter and 2nd letter repseicitvely

- TRANSFORM words w/ numbers into alphabetical characters
    - For each word
    - Set code to the digits of the word converted to ASCII
    - REPLACE the integers in the wrod with the value of code
- JOIN the array of words
=end

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def decipher_this(message)
  message = message.split.map do |word|
    code = word.gsub(/[^0123456789]/, '').to_i.chr
    word = word.chars.map { |char| ALPHABET.include?(char) ? char : '' }.join
    code + word
  end

  message.map do |word|
    if word.size > 2
      second_letter, last_letter = word[1], word[-1]
      word[1] = last_letter
      word[-1] = second_letter
      word
    else
      word
    end
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"