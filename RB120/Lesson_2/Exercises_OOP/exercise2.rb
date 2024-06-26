=begin

Modify the class definition from above to facilitate the 
following methods. 

Note that there is no name= setter method now.

bob = Person.new('Robert')
bob.name                  # => 'Robert'
bob.first_name            # => 'Robert'
bob.last_name             # => ''
bob.last_name = 'Smith'
bob.name                  # => 'Robert Smith'

=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @name = n
    @first_name = n
    @last_name = ''
  end

  def name
    first_name + ' ' + last_name
  end
end

bob = Person.new('Robert')

puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'