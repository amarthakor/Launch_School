# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a character.
puts "Please enter words or multiple words"

words = gets.chomp

count_words = words.count("A-Z" + "a-z")

puts "There are #{count_words} in '#{words}'"