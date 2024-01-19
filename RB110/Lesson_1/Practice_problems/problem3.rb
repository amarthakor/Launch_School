# In the ages hash, remove people with age 100 and greater
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# P
# Given the `ages` hash, remove all values that are greater than or equal to 100
# input: hash
# output: hash
#
# E
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 } =>
# ages = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
#
# D
#
# A
# for each value,
  # check to see if the value is >= 100
    # if true, delete that key-value pair

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |key, value| value >= 100 }
puts ages