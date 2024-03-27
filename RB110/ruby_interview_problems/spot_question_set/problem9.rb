=begin
Background
7:24pm
Requirement
return a string where:
1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, 
  for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), 
  comma(,) and period(.)
5) ignore capitalisation

Problem: Given a string return a modified string

Rules:
1) First and last characters remain in same spot for each word
2) Characters between 0...-1 must be sorted alphabetically
3) Punctuation should remain in the same place in the return string
4) words are separated by single spaces
5) special characters do not separate words, i.e. they are all one word
6) ignore all punctuation except hypehn, comma, period, apostrophe - , . ' 
7) Case doesn't matter

8) If string is 3chars long or less, return the same string

Examples: 


Algorithm:

=end

def scramble_words(words)
end

# p scramble_words('professionals') == 'paefilnoorsss'
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
p scramble_words('card-carrying') #== 'caac-dinrrryg'
p scramble_words("shan't") #== "sahn't"
p scramble_words('-dcba') #== '-dbca'
p scramble_words('dcba.') #== 'dbca.'
# p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's
# nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul
# neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."