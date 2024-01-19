# Add up all the ages from the following hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#          "Marilyn" => 22, "Spot" => 237 }
#
# P
# Given a hash with multiple KV pairs, add up all the values/"ages"
# input: hash
# output: integer
#
# E
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#          "Marilyn" => 22, "Spot" => 237 }
# the total sum of ages from `ages` will be 6174
#
# D
#
# A
# create a variable `total_age` to represent the sum of the ages of the Munster
# family hash
# for each value,
  # increment the total_age by the current age

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
         "Marilyn" => 22, "Spot" => 237 }
age_total = 0

ages.each_value { |age| age_total += age}
puts age_total == 6174