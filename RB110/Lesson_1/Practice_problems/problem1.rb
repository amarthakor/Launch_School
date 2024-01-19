# Turn the given array into a hash where the names are the keys and the values
# are the positions in the array.
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# P
# Transform the given array into a hash, where the key is represented by the element value
# from the array, and the value is represented by the elements respective index value
# input: An array of strings
# output: a hash
#
# E
# trans_to_hsh(["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]) ==
# { "Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4, "BamBam" => 5]
#
# D
# beginning DS: array of string elements
# intermediate DS: transofrm array to hash
# end DS: hash 
#
# A
# initialize an empty hash to store our key-value pairs
# for each name, (indicates iterative method will be used)
  # set the name as the key and its respective index as the value


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_pairs = {}

flintstones.each_with_index { |name, idx| flintstones_pairs[name] = idx}

puts flintstones_pairs
