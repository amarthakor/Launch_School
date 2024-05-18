# Write a minitest assertion that will fail if the class of value is not 
# Numeric or one of Numeric's 
# subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_numeric_value?
    assert_kind_of(Numeric, value.class)
  end
end