require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = 'hi there'
    str2 = 'hi there'

    assert_equal(str1, str2) # will pass as values are same
    assert_same(str1, str2) # Will fail as objects themselves are different
  end
end

# class Car
#   attr_accessor :wheels, :name

#   def initialize
#     @wheels = 4
#   end

#   def ==(other)                       # assert_equal would fail without this method
#     other.is_a?(Car) && name == other.name
#   end
# end