# Modify the block so that it prints the current number and stops iterating when
# the number equals 2

# 5.times do |index|
#   puts index
#   # ...
# end

5.times do |index|
  puts index
  break if index == 2
end