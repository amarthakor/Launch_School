=begin
# Write a function, snakecase, that transforms each word in a 
sentence to alternate between lower (even index value) and upper 
(odd index value) cases when the word before or after it  begins with "s". -- Amar




Problem: Given a string, return a modified string

Rules:
- FOR each word
  - IF the word before ora fter begins with 's'
  - even index should be lowercased
  - odd index should be upcased

- check if word before or after begins with 's'
  - if so, modify even and odd indexes
  - otherwise, leave alone

Algorithm:
- CONVERT string into an array of words
- TRANSFORM FIRST word and set variable to first_word
  - if 2nd word starts with 's'
    - upcase all odd indexes
    - downcase all even indexes
  - otherwise leave word alone
  - convert array into string
- TRANSFORM LAST word and set last_word
  - if -2index word starts with 's'
    -upcase all odd indices
    - downcase all even indices
  - otherwise leave word alone
  - convert array into string
- TRANSFORM all words in array except first and last
  - for each word
    - if index is 0 or -1
      - next
    - elsif word previously or afterwards start with 's'?
      - upcase all odd indices
      - downcase all even indices
    - else
      - leave word alone
  - convert words into string
- COMBINE first_word + middle section + last_word

=end

def snakecase(string)
  string = string.split
  first_word = if string[1][0] == 's'
    string[0].chars.map.with_index do |char, idx|
      idx.even? ? char.downcase : char.upcase
    end.join
  else
    string[0]
  end

  last_word = if string[-2][0] == 's'
    string[-1].chars.map.with_index do |char, idx|
      idx.even? ? char.downcase : char.upcase
    end.join
  else
    string[-1]
  end

  middle = string.map.with_index do |word, idx|
    if idx == 0 || idx == string.size - 1
      next
    elsif string[idx - 1][0] == 's' || string[idx + 1][0] == 's'
      word.chars.map.with_index do |char, idx|
        idx.even? ? char.downcase : char.upcase
      end.join
    else
      word
    end
  end.join(' ')

  first_word + middle + last_word
end

# Test cases
p snakecase("Snakes slither silently") == "sNaKeS sLiThEr sIlEnTlY"
puts snakecase("simple sentence structure") == "sImPlE sEnTeNcE sTrUcTuRe"
puts snakecase("apples are sweet") == "apples aRe sweet"
puts snakecase("swiftly swimming swans") == "sWiFtLy sWiMmInG sWaNs"
puts snakecase("the sun sets slowly") == "tHe sUn sEtS sLoWlY"
p snakecase("A quick brown fox") == "A quick brown fox"