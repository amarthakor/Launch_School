# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
#
# ----- P
# Write a method that removes all vowels from an array of string elements
# Input: array of strings
# Output: array of strings
#
# Explicit Rules
# - input will always be array with string elements
# - we will only remove vowels defined as aeiou
# Implicit Rules
# - in addition to lowercase vowels, we will also remove uppercasse vowels
# - Return an empty string if a given string consists of only vowels
#
# ----- E 
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
# 
#
# ----- D
# will work with arrays to allow easy TRANSFORMATION of individual elements
#
# ----- A
# given an array of elements, where each element is a string object;
#
# Transform each array element to not contain any vowels(upper+lowercase)
#  Iterate over each element and delete any characters in the string that
#  we dictate a vowel ['aeiouAEIOU']

def remove_vowels(words)
  words.map { |word| word.delete('aeiouAEIOU')}
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']