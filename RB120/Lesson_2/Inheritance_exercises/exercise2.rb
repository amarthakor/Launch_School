=begin

Let's create a few more methods for our Dog class.


class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end


Create a new class called Cat, which can do everything a dog can, 
except swim or fetch. Assume the methods do the exact same thing. 

Hint: don't just copy and paste all methods in Dog into Cat; 
try to come up with some class hierarchy.

=end

class Pet

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'Bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'Meow!'
  end
end

class Bulldog < Dog 
  def swim
    "can't swim!"
  end
end

kitty = Cat.new
dave = Bulldog.new

puts dave.swim
puts kitty.speak
puts kitty.run
puts kitty.jump
