=begin

Which of these two classes would create objects that 
would have an instance variable and how do you know?


class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

puts "class Pizza would instantiate objects that have an instance variable. We
know this because within the initialize method of Pizza class, we assign the
parameter to '@name', which is the syntax for an instance variable."

puts
puts "class Fruit on the other hand initializes a local variable called 'name'
and assigns this local variable to the value referenced by the method
parameter. 'name' is not an instance variable, but a local variable."

puts
puts "One way to check all instance variables of an object is to invoke the
#instance_variables method on an object from a custom class"