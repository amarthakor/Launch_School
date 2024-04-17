=begin

Create a class called MyCar. When you initialize a new instance or object of the class, 
allow the user to define some instance variables that tell us the year, color, and model 
of the car. Create an instance variable that is set to 0 during instantiation of the 
object to track the current speed of the car as well. Create instance methods that allow 
the car to speed up, brake, and shut the car off.

=end

class MyCar

  def initialize(model, color, year)
    @model = model
    @color = color
    @year = year
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You slam on the gas pedal and accelerate by #{number} mph!"
  end

  def brake(number)
    @current_speed -= number
    puts "You hit the brakes and slow down bye #{number} mph"
  end

  def current_speed
    puts "You are currently going #{@current_speed} mph."
  end

  def shut_off_car
    @current_speed = 0
    puts "You slam the brakes and 360 park into a handicapped spot."
  end

end

aventador = MyCar.new("Lamborghini Aventador", "Lavendar", "2102")
aventador.speed_up(200)
aventador.current_speed
aventador.brake(100)
aventador.current_speed
aventador.brake(90)
aventador.current_speed
aventador.shut_off_car
aventador.current_speed