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

What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=end

class Television
  def self.manufacturer # class method, not invoked on instance objects
    # method logic
  end

  def model             # instance method, invoked on instance objects not class objects
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new # tv is an instance object of Television
tv.manufacturer # NoMethodError is returned bc instance object is invoking class method
tv.model # return logic of the instance method body

Television.manufacturer # returns logic from the class method manufacturer
Television.model        # returns no method error bc there is no class method 'model'