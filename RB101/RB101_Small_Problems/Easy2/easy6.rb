# Print all odd numbers from 1..99, including 1 & 99 w/ each number on a 
# separate line

numbers = (1..99).to_a

numbers.each do |num|
  puts num if num.odd?
end
