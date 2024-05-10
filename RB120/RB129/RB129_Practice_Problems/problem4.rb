# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes

class ClassA 
  attr_reader :field1, :field2
  
  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end
end

class ClassB 
  attr_reader :field1

  def initialize
    @field1 = "abc"
  end
end


obj1 = ClassA.new(50) # @field1 = 'xyz', @field2 = 50
obj2 = ClassA.new(25) # @field1 = 'xyz', @field2 = 25
obj3 = ClassB.new     # @field1 = 'abc'

# p obj1 > obj2
# p obj2 > obj3

p obj1.field2 > obj2.field2 # comparing intgers via @field2
p obj2.field1 > obj3.field1 # comparing strings via @field1