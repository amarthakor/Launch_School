=begin

What is the default return value of to_s when invoked on an object? 
Where could you go to find out if you want to be sure?

=end

puts "The default return value of 'to_s' when invoked on an object is the object's
class and an encoding of its object ID"
puts
puts "To be sure of the return value, one can check the class documentation to see if there
is a custom 'to_s' method defined, or if its a custom class, check if there is a 
custom defined 'to_s' method."