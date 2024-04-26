=begin

You are given the following class that has been implemented:

Copy Code
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end
end

And the following specification of expected behavior:

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  => "Plain"

puts donut2
  => "Vanilla"

puts donut3
  => "Plain with sugar"

puts donut4
  => "Plain with chocolate sprinkles"

puts donut5
  => "Custard with icing"

Write additional code for KrispyKreme such that the puts statements will work as specified above.

=end


class KrispyKreme
  attr_reader :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    if filling_type == nil && glazing == nil
      "Plain"
    elsif filling_type == nil
      "Plain with #{glazing}"
    elsif glazing == nil
      "#{filling_type}"
    else
      "#{filling_type} with #{glazing}"
    end
  end
end

# Alternative solution
# def to_s
#   filling_string = filling_type ? filling_type : "Plain"
#   glazing_string = glazing ? " with #{glazing}" : ''
#   filling_string + glazing_string
# end


donut1 = KrispyKreme.new(nil, nil) # 'Plain'
donut2 = KrispyKreme.new("Vanilla", nil) # 'Vanilla'
donut3 = KrispyKreme.new(nil, "sugar") # 'Plain w/ sugar'
donut4 = KrispyKreme.new(nil, "chocolate sprinkles") # 'Plain w/ choc sprink'
donut5 = KrispyKreme.new("Custard", "icing") # Custard w/ icing

puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

