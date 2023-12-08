# Print all even numbers from 1..99 to the console w/ each numbe ron a separate line

numbers = (1..99).to_a

numbers.each do |num|
  puts num if num.even?
end
