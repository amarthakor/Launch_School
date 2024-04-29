=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. 
The implementation details for the #initialize methods in Graduate 
and Undergraduate are missing. Fill in those missing details so 
that the following requirements are fulfilled:

Graduate students have the option to use on-campus parking, 
while Undergraduate students do not.

Graduate and Undergraduate students both have a name and year 
associated with them.

Note, you can do this by adding or altering no more than 5 lines of code.

=end

# - Add implementation details for Graduate and Undergraduate class
#   - Grad students have option to use on-campus parking
#   - Undergraduate students cannot use on-campus parking

#   - Grad + Undergrad students both have name and year associated

#   - Can only add or alter 5 lines of code max

class Student
  attr_reader :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @park = parking
  end
end

class Undergraduate < Student
end

amar = Undergraduate.new('amar', '2015')
puts amar.name
puts amar.year