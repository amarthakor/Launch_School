=begin
Continuing with our Person class definition, what does the below code print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

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

  def to_s
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts[0]
    self.last_name = parts.size > 1 ? parts[1] : ''
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

puts "The above code will print out 'The person's name is: Robert Smith' "