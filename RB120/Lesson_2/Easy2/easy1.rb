=begin
You are given the following code:


class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end


What is the result of executing the following code:

oracle = Oracle.new
oracle.predict_the_future

=end

puts "This code will return a string, but will not output anything to
the display. The return string could have 3 possible values, depending on which
array element is returned from the #sample method."