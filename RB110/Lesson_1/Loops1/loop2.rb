# Modify the code so each loop stops after the first iteration
# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#   end
# end

# puts 'This is outside all loops.'

loop do
  puts 'this is the outer loop.'

  loop do
    puts 'this is the inner loop.'
    break
  end

  break
end

puts 'this is outside all loops'