# Write a minitest assertion that will fail if value is not nil.
require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_nil
    assert_nil(value)
  end
end