=begin

Now create a smart name= method that can take just a first name or 
a full name, and knows how to set the first_name and last_name 
appropriately.

- Create smart 'name=' method
  - this method can take a first_name arugment or full_name argument
  - and set the first_name and last_name as specified

=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    first_name + ' ' + last_name
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts[0]
    self.last_name = parts.size > 1 ? parts[1] : ''
  end
end

bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
bob.last_name = 'Smith'
puts bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
puts bob.first_name            # => 'John'
puts bob.last_name             # => 'Adams'