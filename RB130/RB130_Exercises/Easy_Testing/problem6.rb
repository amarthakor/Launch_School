# Write a minitest assertion that will fail unless employee.hire 
# raises a NoExperienceError exception.


require 'minitest/autorun'

class SampleEmployee < Minitest::Test
  def test_no_experience_error
    assert_raises(NoExperienceError) { employee.hire }
  end

end