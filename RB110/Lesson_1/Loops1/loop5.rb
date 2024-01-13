# Modify the code so "Hello!" is printed 5 times."
# say_hello = true

# while say_hello
#   puts 'Hello!'
#   say_hello = false
# end

say_hello = true

counter = 0
while say_hello
  puts 'hello'
  counter += 1
  if counter == 5
    say_hello = false
  end
end
