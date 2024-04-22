=begin
Given the following code...


bob = Person.new
bob.hi

And the corresponding error message...


NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'


What is the problem and how would you go about fixing it?

=end

puts "The problem is that the 'hi' method invoked on the instance object 'bob' is
private and therefore access to this method is not allowed outside of the class.
In order to make it's access available, the 'hi' method would need to be removed from
the 'private' methods section and added to the section above the 'private' section."