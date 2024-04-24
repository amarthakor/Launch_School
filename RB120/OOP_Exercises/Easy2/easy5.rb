=begin

What will the following code print?


class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

=end

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata # output 'ByeBye' because class method definition 
puts thing.dupdata     # outputs 'HelloHello' because isntance method definition

puts '------------'

puts "ByeBye"
puts "HelloHello"