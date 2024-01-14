# Modify the code so that the users input gets added to the 'numbers' array.
# Stop the loop when the array contains 5 numbers.

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
# end
# puts numbers

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  if numbers.size == 5
    puts "Your numbers:"
    break
  end
end

puts numbers