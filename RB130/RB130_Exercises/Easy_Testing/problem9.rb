# Write a test that will fail if list and the return value of list.process are different objects.
# object ID wise not return value wise
require 'minitest/autorun'

class SampleList < Minitest::Test
  def test_list_object
    assert_same(list, list.process)
  end
end