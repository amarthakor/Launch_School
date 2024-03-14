=begin
# # Implement a function, capitalize, that capitalizes all words in a sentences. 
However, only capitalize if the word is followed by a word starting with a vowel 
(for Ruby don’t use capitalize). 

# # Test cases
# puts capitalize("hello apple world") # "Hello apple world"
# puts capitalize("this is an umbrella") # "This Is An umbrella"
# puts capitalize("every vowel starts an echo") # "every vowel Starts An echo"
# puts capitalize("under the oak tree") # "under The oak tree"
# puts capitalize("a quick brown fox") # "a quick brown fox

5:57
--- P
-given: string
-return: modified string where;
        - cannot use #capitalize
        - capitalize all words in a sentence
          - ONLY capitalize words if they are followed by a word that starts w/ a vowel
            aeiou

- given string will be in lowercase
- assume string wont be empty
--- E
-  capitalize("this is an umbrella") # "This Is An umbrella"
    - words followed by a word starting with a vowel: this, is, an, 
      -> This Is An umbrella

-  capitalize("every vowel starts an echo") # "every vowel Starts An echo"
    - words followed by word start w/ vowel: starts an
      -> every vowel Starts An echo
--- D
- beginning: string
- mieddle: use array to iterate over entire sentence, check words and chars, apply modifications
- ending: modified string
--- A
- SPLIT the string into an array of words
- TRANSFORM the string by ITERATING over each element where
  - if the next words first character starts with aeiou?
    - upcase the first letter in the current word
  - otherwise just return the normal word
- JOOIN the array back into a string

=end

def capitalize(string)
  string = string.split

  string.map.with_index do |word, idx|
    if idx + 1 < string.size && 'aeiou'.include?(string[idx + 1][0])
      word[0] = word[0].upcase
      word
    else
      word
    end
  end.join(' ')
end

p capitalize("hello apple world") == "Hello apple world"
p capitalize("this is an umbrella") == "This Is An umbrella"
p capitalize("every vowel starts an echo") == "every vowel Starts An echo"
p capitalize("under the oak tree") == "under The oak tree"
p capitalize("a quick brown fox") == "a quick brown fox"