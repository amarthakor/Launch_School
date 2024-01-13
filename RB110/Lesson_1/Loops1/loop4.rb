# Modify the code so the loop stops iterating when the user inputs 'yes'
# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
# end

loop do
  puts 'Should i stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'yes'
  puts "Invalid answer, enter 'yes' to exit loop."
end
