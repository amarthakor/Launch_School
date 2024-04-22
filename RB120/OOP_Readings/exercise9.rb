=begin

Create a superclass called Vehicle for your MyCar class to inherit from and
move the behavior that isn't specific to the MyCar class to the superclass.
Create a constant in your MyCar class that stores information about the 
vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that
also has a constant defined that separates it from the MyCar class in some way.

- create superlcass called Vehicle
  - move generic Vehicle behaviors from MyCar to Vehicle superlcass
- Create constant in MyCar class that stores specific info of my vehicle
- Create new class called MyTruck
  - Inherits behavior from Behicle Supperlcass
  - Also has a constant defined that separates it from MyCar

=end


class Vehicle

  attr_accessor :color
  attr_reader :year, :model

  def initialize(model, color, year)
    @model = model
    @color = color
    @year = year
    @current_speed = 0
  end

  def self.miles_per_gallon(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
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

  def spray_paint(color)
    self.color = color
    puts "You decide to change the color of your car and put a nice new shiny #{color} wrap on it!"
  end

end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "My #{model} is a sexy #{color} and goes faster than any other car in the universe"
  end

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "My #{model} is a sexy #{color} and goes faster than any other truck in the universe"
  end

end

aventador = MyCar.new('Lamborghini Aventador', 'Lavender', 3000)
puts aventador.to_s
sierra = MyTruck.new('GMC Sierra', 'Steel White', 5000)
puts sierra.to_s