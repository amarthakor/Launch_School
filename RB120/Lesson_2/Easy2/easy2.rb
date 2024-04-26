=begin

We have an Oracle class and a RoadTrip class that inherits from the Oracle class.


class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end


What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

=end

puts "The result from lines 25-26 will first instantiate an object of the RoadTrip
class. Next, it will return one of three predeterming strings, based off the return
value of #sample invoked on the array within the choices instance method. Because
the RoadTrip class overrides the choices method inherited from the Oracle superclass,
Ruby will use the method definition of the choices from the RoadTrip class. Thus, the
return value string will be 'you will visit vegas' or 'you will fly to fiji' or 'you
will romp in rome'"