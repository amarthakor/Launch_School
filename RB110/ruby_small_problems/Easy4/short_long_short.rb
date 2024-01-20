# write a method that takes two strings as arguments, determiens the longest
# of the two strings, and then returns the result of concatenating
# the shorter string, the longer string, and the shorter string once again.
# you may assume that the strings are of different lengths
#
# P
# write a method that takes two strings, determines which one is the longest
# of the two strings. Then it should return the result of combining the short
# string, the long string, and the short string again.
#
# input: string
# output: stirng
#
# Explicit rules
#   - Strings are not equal length
#   - Only string objects will be used
#   - 
#
# E
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"
#
# D
#
# A
# compare the two words where
#   if word1 is > word2
#     long_word = word1
#     short_word = word2
#   else 
#     long_word = word2
#     short_word = word1
# then concatenate short_word + long_word + short_word
#
def short_long_short(word1, word2)
  if word1.size > word2.size
    long_word = word1
    short_word = word2
  else
    long_word = word2
    short_word = word1
  end

  short_word + long_word + short_word
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"