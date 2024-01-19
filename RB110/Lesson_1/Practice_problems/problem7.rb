# Create a hash that expresses the frequency with which each letter occurs in the string
# statement = "The Flintstones Rock"
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
#
# P
# Create a hash where each key is a character from a given and its corresponding
# value is the amount of times that character appears in the string
# input: string
# output: hash
#
# E
# statement = "The Flintstones Rock"
# => { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
#
# D
# beginning: string of characters 
# intermediate: empty hash
# ending: hash with KV pairs
#
# A
# create an empty hash to store our key-value pairs of letters and counts
# isolate each character as its own element into an array
# for each element in the array, 
  # count the number of times that element appears in the array
    # then set the empty hash to the specified letter and its count

statement = "The Flintstones Rock"
letter_count = {}
statement = statement.split('')

statement.map do |letter|
  letter_num = statement.count(letter)
  letter_count[letter] = letter_num
end

puts letter_count
