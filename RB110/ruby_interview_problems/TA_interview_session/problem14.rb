# # Implement a function, capitalize, that capitalizes all words in a sentences.
# However, only capitalize if the word is followed by a word starting with a vowel
# (for Ruby don’t use capitalize). -- Udeshika
=begin

Problem: Given a string, return a modified string

Rules:
- New string or mutated string?
- Return string should capitalize all words in a sentence according to:
  - only capitalize the word if the following word starts with AEIOU
- all words will be in lowercase?

Algorithm:
- CONVERT string into array of words
- ITERATE over array of wors
  - for each char
    - the first character should be capitlaized if the next word starts with aeiou
  - stop iterating at the second to last word
- JOIN the array of words into a string
=end

# def capitalize(string)
#   vowels = ['a', 'i', 'o', 'u', 'e']
#   words = string.split(' ')
#   words.each_with_index do |word, idx|
#     break if idx == words.size - 1

#     if vowels.include?(words[idx + 1][0])
#       word[0] = word[0].upcase
#     end
#   end
#   words.join(' ')
# end

def capitalize(string)
  string = string.split

  string.map.with_index do |word, idx|
    if (idx < string.size - 1) && ('aeiou'.include?(string[idx + 1][0]))
      word[0] = word[0].upcase 
    end
    word
  end.join(' ')
end

# # Test cases
p capitalize("hello apple world") == "Hello apple world"
p capitalize("this is an umbrella") == "This Is An umbrella"
p capitalize("every vowel starts an echo") == "every vowel Starts An echo"
p capitalize("under the oak tree") == "under The oak tree"
p capitalize("a quick brown fox") == "a quick brown fox"