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


You can see in the make_one_year_older method we have used self.

What does self refer to here?

=end

puts "Here, 'self' refers to the object itself that is invoking the method.
in this case, the object would be the caller of the method, or, the calling
object"