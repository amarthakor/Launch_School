=begin

If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end


Which one of these is a class method (if any) and how do you know?
How would you call a class method?
=end

puts "'manufacturer' is a class method as class methods are defined with the
keyword 'self.'"
puts
puts "A class method is called with the name of the class chained to the class method name,
thus for this problem it would be Television.manfucaturer"