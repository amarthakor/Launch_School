# Create a mad-lib program that asks the user for a noun, verb, adverb,
# and adjective, then inputs the given words into a story.
#
# P
# INPUT: 4 string values, noun, verb, adjective, and adverb
# OUTPUT: output string with given 4 strings
# - What happens if one of the 4 values is left blank / whitespace?
# - What if correct part of speech is not entered? i.e. asks for noun but input is verb
# 
# E
# - No empty values / whitespace
# - Assume correct part of speech is used
# - noun: dog, verb: walk, adverb: quickly, adjective: blue
#   => 'Do you walk your blue dog quickly? Thats hilarious!'
#
# D
# - no DS will be utilised
#
# A
# - ask user for noun and save input to variable
# - repeat above for verb, adverb, and adjective
# - interject saved variables into a string w/ string interpolation
# - output said string
# 
# C
puts "Please enter a noun"
noun = gets.chomp

puts "please enter a verb"
verb = gets.chomp

puts "Please enter an adjective"
adjective = gets.chomp

puts "Please enter an adverb"
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
