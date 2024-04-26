=begin

What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

light = Light.new("High", 'Blue')

Light.information # Cannot access state from the instance object

# Here we have a class method #information, but it doesn't add any value and may even
# be incorrect. Also class methods cannot access instance objects, so even if
# string interporlation was used, it wouldn't be of any use.

# Also, we do not need a 'return' before the string, as the last evaluated line in a method is
# automatically returned, therefore there is no use of having an explicit return

# Lastly, we use attr_accessor :brightness, :color
# but we do not end up using any getter or setter methods based off the current class definition
# It may probide some use in the future, but currently, adds no required functionality