=begin
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!
Here's the deal:
It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata" => "#HelloThereThanksForTryingMyKata"
" Hello World " => "#HelloWorld"
"" => false

Problem: Given a string, return a modified string or false

Rules:
- Return false if the modified string is 140 chars longer
- Return false if input is empty string
- Must start iwth a #
- No spaces in between words
- Capitalize all words

Algorithm:
- RETURN false if string is empty
- CONVER the string into an array of words
- TRANSFORM the arra of words
  - for each word
    - capitalize the word
- JOIN the array of words
- ADD an # to the string of words
- COUNT the size of the string, if its > 140, return false otherwis return the string
=end

def generateHashtag(string)
  return false if string.empty? || string.chars.map { |char| char == ' ' }.all?

  string = string.split.map { |word| word.capitalize }.join
  string = "##{string}"

  string.size > 140 ? false : string
end


p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p
generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false