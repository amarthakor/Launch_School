=begin

If we have the class below,

what would you need to call to create a new instance of this class.


class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

=end

puts "Given the class definition above, we would need to call 'Bag.new' with two arguments
the color and the material of the bags. Thus, our call would look something like
this: Bag.new('black', 'leather')"
