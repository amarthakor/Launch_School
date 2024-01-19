# Given the hash below, 
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# modify the hash such that each member of the family has an add'l "age_group" key
# that has one of three values describing the age group the family meber is in
# (kid, adult, or senior). Your solution should produce the hash below:
#
# { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
#   "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
#   "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
#   "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
#   "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
# a kid is 0-17, adult is 18-64, and sneior is 65+

# P
#
# Modify the given hash such that the value of each key-value pair (which is also a hash)
# has an additional key-value pair, where the key is "age_group" and the 
# value is their respective group, "kid", "adult", or "senior"
#
# input: hash
# output: hash
#
# E
# as above
#
# D
# beginning: hash
# intermediate
# end: hash
#
# A
# for each key-value pair in our given hash
  # if the value of the age is between 0-17
    # modify the hash and add the value "age_group" which is equal to 'kid'
  # elsif the value of the age is between 18-64
    # modify the hash and add the value "age_group" which is equal to "adult"
  # else
    # modify the hash and add the value "age_group" which is equal to "senior"

munsters = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
             "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
             "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
             "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
             "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

munsters.each do |name, info|
  if info["age"] == 0...17
      info["age_group"] = "kid"
  elsif info["age"] == 18...65
         info["age_group"] = "adult"
  else
       info["age_group"] = "senior"
  end
end

puts munsters