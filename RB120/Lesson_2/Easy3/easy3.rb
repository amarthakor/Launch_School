=begin

When objects are created they are a separate realization of a
particular class.

Given the class below, how do we create two different instances
of this class with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

=end

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Given the class above, how do we create two different instances
# of this class with separate names and ages?

nice_cat = AngryCat.new(3, 'Kylo')
p nice_cat
mean_cat = AngryCat.new(4, 'Zues')
p mean_cat