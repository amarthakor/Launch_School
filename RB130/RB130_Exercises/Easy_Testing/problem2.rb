# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
require 'minitest/autorun'

class SampleTest < Minitest::Test
  def test_downcase
    assert_equal('xyz', value.downcase)
  end
end