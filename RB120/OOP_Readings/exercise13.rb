=begin

Move all of the methods from the MyCar class that also pertain to 
the MyTruck class into the Vehicle class. Make sure that all of 
your previous method calls are working when you are finished.

=end


module Bed_Space
  def amount_of_bed_space(sq_ft)
    "My truckbed has #{sq_ft} sq ft of space"
  end
end

class Vehicle

  attr_accessor :color
  attr_reader :year, :model

  @@num_of_vehicles = 0

  def initialize(model, color, year)
    @model = model
    @color = color
    @year = year
    @current_speed = 0
    @@num_of_vehicles += 1
  end

  def self.num_of_vehicles
    @@num_of_vehicles
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
  include Bed_Space

  NUMBER_OF_DOORS = 2

  def to_s
    "My #{model} is a sexy #{color} and goes faster than any other truck in the universe"
  end
end

aventador = MyCar.new('Lamborghini Aventador', 'Lavender', 3000)
sierra = MyTruck.new('GMC Sierra', 'Steel White', 5000)

puts aventador.spray_paint("Turquiose")
