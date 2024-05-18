# Write a minitest assertion that will fail if the 'xyz' is not in the Array `list`.

require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_array_value
    assert_includes(list, 'xyz')
  end
end