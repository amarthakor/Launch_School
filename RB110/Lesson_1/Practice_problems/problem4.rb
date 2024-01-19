# pick out the minimum age from the current Munster family hash:
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#          "Marilyn" => 22, "Spot" => 237 }
#
# P
# Given the Munster hash, sort through the ages/values and identify the lowest value
# input: hash
# output: integer
#
#
# E
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# => 10
# 
# D
#
# A
# isolate and store all the values/ages into a new variable
# sort the values/ages from lowest to highest
# pick the first value/age
#

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_only = ages.values.sort.first
puts ages_only