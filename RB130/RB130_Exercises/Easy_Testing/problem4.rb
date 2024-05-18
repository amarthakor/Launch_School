# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_empty_array
    assert_equal(true, list.empty?)
  end
end