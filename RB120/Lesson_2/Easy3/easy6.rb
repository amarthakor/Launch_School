=begin
If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end


In the make_one_year_older method we have used self. 
What is another way we could write this method so we 
don't have to use the self prefix?

=end

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1 # Here we changed 'self.' to '@age' to reference the instace var itself
  end
end

cat = Cat.new("mean")

puts cat.age # -> 0
cat.make_one_year_older
puts cat.age # -> 1