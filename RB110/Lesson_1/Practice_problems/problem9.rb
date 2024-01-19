# Given a string, create a method that capitalizes each new word
# words = "the flintstones rock"
# words = "The Flintstones Rock"
#
# P
# When given a string, capitalize the first letter of each word
# input: stirng
# output: string
#
# E
# words = "the flintstones rock" =>
# words = 'The Flintstones Rock'
#
# D
# beginning: string 
# intermediate: array to allow iteration over each word
# end: string 
#
#A
# take given string and transform it into an array
# for each element
  # capitalize the elemtn
# transform the array back into a string

words = "the flintstones rock"

def capitalizer(string)
  string = string.split(' ')

  string = string.map { |name| name.capitalize}.join(" ")
end

p capitalizer(words)
