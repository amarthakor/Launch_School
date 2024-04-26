=begin

In the last question we had a module called Speed which contained a go_fast method.
 We included this module in the Car class as shown below.


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

When we called the go_fast method from an instance of the Car class
(as shown below) you might have noticed that the string printed when
we go fast includes the name of the type of vehicle we are using.
 How is this done?


>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!

=end

puts "The string printed includes the name of the type of vehicle because we
are using the keyword 'self.' chained to the class of the object that is invoking the
go_fast method. Here, 'self.' lets Ruby know we are referring to the object that invoked
the go_fast method, and then chain '.class' to let Ruby know we want to know
the class of the object."