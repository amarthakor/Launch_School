=begin
[Train: Typoglycemia Generator \| Codewars](https://www.codewars.com/kata/55953e906851cf2441000032/train/ruby)
5 kyu
10:35
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

--- P
- given: a string argument
          - can be single word or
          - contain multiples words
- return: a new string where
        - the first and last chars will remain in palce
            idx 0 and -1 will remain in place
        - chars between index 1..-2 will be sorted alphabetically
        - punctuation should unmodified, its index position will not change
- words will be separated by a single space
- words are defined by having spaces, special chars do not define new words; tik-tak -> tai-ktk
- special chars remain in the same index
  - -dcba -> -dbca (here the '-' does not change index positions)
- we will only have a maximum of 4 possible punctuation chars in our problem, '-', " ' ", ',', '.'
- case does not matter
- assume that chars that are the same have no priority to be sorted in specific manner against other chars that are the same
- if string arg is empty, return empty string
- if string arg is 1 char long, return the given char
- strings upto length of 3 will always remain the same, as long as their is no punctuation
--- E
- scramble_words('professionals') == 'paefilnoorsss'
  - 'professionals'
    - 'p         s' # first index, last inde remains the same
                    # #first, #last, or 0index and -1 index?
    -> 'paefilnoorsss'.. sort chars from index 1..-2 alphabetically

- scramble_words('card-carrying') == 'caac-dinrrryg'
  - 'card-carrying'
    - 'c   -       g'
    - 'caac-dinrrryg'
    # how can i track the index of special chars and keep them in the same index without shifting them?
    # sort sorts thru chars where special chars from alphabetical chars

- scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

  - index 3, 5, 6, 7, 10, 11, 13, 16, 17, 18, 23, 
    - 'you've'
      - 'y..'.e'
      - 'you've'
  - 'like'. 'love'
    -'like', 'love'

--- D
- given string
- array for sorting and tracking index values of chars
- return string

--- A
- INITIALIZE empty string result placeholder
- CHECK if my 1..-2 has any special characters
  - if it does 
    - store the special char and its index value somewhere
- CREATE a string of chars from index 1..-2
- SORT this substring by alphabetical order
- REPLACE the char at the index of the special char and add the replaced char too?
  - i.e. '....f...' 
    - 'f' is at the same index of the spec char, but we need the 'f'
    - so reassign this index to equal the special char AND 'f'
    - then put it into the string at the respective index
- APPEND the first char and the last char
  - shift the first char so that its at index 0
  - append the last char with << so its at index -1
- RETURN the modified string
=end
p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."