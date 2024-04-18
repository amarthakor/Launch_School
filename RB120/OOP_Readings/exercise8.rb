=begin
When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?

=end

puts "We get the error in the description because we attempt to use the instance
setter method '.name' on line 12, however, we have not defined an instance setter method
for the object, therefore Ruby produces an error. We can resolve this issue by
adjusting line 5 to attr_writer if we only want to SET names or we can set it to
attr_accessor if we want to both expose(getter method) or reassign (setter method) the
value of the instance variable."