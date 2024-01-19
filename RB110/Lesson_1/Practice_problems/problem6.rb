# Adjust the array below so that all names are shortened to just the first three
# characters. Do no create a new array
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# P
# Transform the array so that all string elements are only composed of the first
# 3 characters
# input: array
# output: array
#
# E
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# => ['Fre', "Bar", "Wil", "Bet", "Bam", "Peb"]
#
# D
#
# A
# for each name
  # mutate the array to only reference the first 3 chars of name

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map! { |name| name[0, 3] }
