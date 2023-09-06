# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, 
# and an adjective and injects those into a story that you create.

puts "Please enter a noun"
noun = gets.chomp

puts "Please enter a verb"
verb = gets.chomp

puts "Please enter an adverb"
adv = gets.chomp

puts "Please enter an adjective"
adj = gets.chomp

puts "Do you #{verb} your #{adj} #{noun} #{adv}? That's hilarious!"
