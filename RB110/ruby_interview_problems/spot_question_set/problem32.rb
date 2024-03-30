=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet:
 a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.
If two words score the same, return the word that appears earliest in the original string.
All letters will be lowercase and all inputs will be valid.

Problem: Given a string, return a substring

Rules:
- Returned substring will be a word from the string
  - This word will have the 'highest score'
- Words are scored by summing their total points
- Points are scored by a characters position in the alphabet
  - a = 1.. z = 26
- If two words have the same score, return the one that appeared first
- All input is valid, only lowercase string arguments

Algorithm:
- CREATE a empty hash to have KV apirs of words and their scores
- CREATE a max score array
- CREATE an array of the alphabet
- ITERATE over an array of words
  - for each word
  - create KV pairs in the hash, the word is the key and the value is 0
- ITERATE over an array of words again
  - for each word
    - CREATE a score variable and assign it to 0
    - ITERATE over the chars
      - for each char
      - incremenet the score by its position + 1 in the alphabet array
      - set the value for the word to the current value of the score in the hash
- SELECT the values max value
- SELECT all KV pairs that are == to the max value
- RETURN the first key in the KV pair of max KV values

=end

ALPHA = ('a'..'z').to_a

def high(string)
  word_scores = {}
  max_score_words = []

  string.split.each { |word| word_scores[word] = 0}
  string.split.each do |word|
    score = 0
    word.chars.each do |char|
      score += ALPHA.index(char) + 1
      word_scores[word] = score
    end
  end

  max_value = word_scores.values.max
  word_scores.select { |word, score| score == max_value }.first[0]
end


p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b c') == 'aaa'