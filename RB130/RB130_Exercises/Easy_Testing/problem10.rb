# Write a test that will fail if 'xyz' is one of the elements in the Array `list`
require 'minitest/autorun'

class SampleList < Minitest::Test
  arr
  def test_list_object
    refute_includes(list, 'xyz')
  end
end