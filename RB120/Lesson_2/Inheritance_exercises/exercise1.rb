=begin

Given this class:

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

One problem is that we need to keep track of different breeds of dogs,
since they have slightly different behaviors. For example, bulldogs can't swim, 
but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

=end

class Dog # superclass
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog  # subclass
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

betty = Bulldog.new
puts betty.swim