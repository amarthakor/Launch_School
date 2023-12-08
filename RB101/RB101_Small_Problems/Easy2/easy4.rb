# build a program that displays when the user will retire and how many
# years they have to work till retirement.
#
puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_till_retired = retirement_age - age
retirement_year = Time.now.year + years_till_retired

puts "It's 2023. You will retire in #{retirement_year}"
puts "You only have #{years_till_retired} years of work to go!"
