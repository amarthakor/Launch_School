# Write a program taht will ask for user's name. The program will then
# greet the user, if the user writes 'name!' then the computer yells
# back to the user.
#
# What is your name? Bob
# Hello Bob.
#
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def get_name
  puts "what is your name?"
  name = gets.chomp
end

def greeting(name)
  if name.match('!')
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name.capitalize}."
  end
end

name = get_name
greeting(name)
