# 7 kyu problem - Longest vowel chain
# The vowel substrings in the word 'codewarrs' are o, e, a, and io. The longest
# of these has a length of 2. Given a lowercase string that has alphabetic
# characters only and no spaces, return the length of the longest vowel
# substring. Vowels are of aeiou.

# P
# Given a string of only alphabetical characters, in lowercase, with no spaces,
# return the length of the longest chain of vowels in a row.
# input: string
# output: integer
#
# Explicit rules
#               - only alphabetical chars
#               - all lowercase chars
#               - vowels are any of 'a, e, i, o, u'
#               - always provided a string
# Implicit rules
#
# E
# p longest_vowel("codewarriors") == 2
# p longest_vowel("suoidea") == 3
# p longest_vowel("iuuvgheaae") == 4
# p longest_vowel("ultrarevolutionariees") == 3
# p longest_vowel("strengthlessnesses") == 1
# p longest_vowel("cuboideonavicuare") == 2
# p longest_vowel("chrononhotonthuooaos") == 5
# p longest_vowel("iiihoovaeaaaoougjyaw") == 8
#
# D
# beginning: string
# intermediate: array
# end: array
#
# A
# set non_vowels to RegEx for all alpha chars that aren't 'aeiou'
# replace all non-vowel chars with whitespace
# split the string into an array with elements between whitespace
# for each word,
  # find the size of the word
  # choose the largest value of the words
  



def longest_vowel(word)
  non_vowels = /[bcdfghjklmnpqrstvwxyz]/

  word.gsub!(non_vowels, " ")
  word = word.split(' ')
  word.map { |count| count.size }.max
end

p longest_vowel("codewarriors") == 2
p longest_vowel("suoidea") == 3
p longest_vowel("iuuvgheaae") == 4
p longest_vowel("ultrarevolutionariees") == 3
p longest_vowel("strengthlessnesses") == 1
p longest_vowel("cuboideonavicuare") == 2
p longest_vowel("chrononhotonthuooaos") == 5
p longest_vowel("iiihoovaeaaaoougjyaw") == 8