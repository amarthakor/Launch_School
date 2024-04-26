=begin

There are a number of variables listed below. 
What are the different types and how do you know which is which?


excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

=end

puts "excited_dog is a local variable, we know this bc local_variables dont have any
prefixed chars"
puts
puts "@excited_dog is an instance variable, we know this because it starts with an @"
puts
puts "@@excited_dog is a class level variable, we know this because it starts 
with @@"