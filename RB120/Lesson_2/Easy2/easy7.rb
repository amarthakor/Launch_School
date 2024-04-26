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


Explain what the @@cats_count variable does and how it works. 
What code would you need to write to test your theory?

=end

puts "In this problem, the @@cats_count variable tracks the amount of Cat
objects we have instantiated. Every time we instantiate a new Cat object, we
incremeent the value of @@cats_count by + 1."

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

puts Cat.cats_count

kylo = Cat.new('mean')

puts Cat.cats_count

luna = Cat.new('nice')

puts Cat.cats_count