=begin

If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

In the name of the cats_count method we have used self. 
What does self refer to in this context?

=end

puts "'self' in the name of a method definition within a class signifies a class method.
Here, 'self' is referncing the class itself, so in this case it would be referncing Cat class.
self.cats_count would be the same as Cat.cats_count"