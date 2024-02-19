=begin

 Determine the total age of just the male members of the family

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |key, _|
  total_age += munsters[key]["age"] if munsters[key]["gender"] == "male"
  # if munsters[key]["gender"] == 'male'
  #   total_age += munsters[key]["age"]
  # end
end

puts total_age # should output 444