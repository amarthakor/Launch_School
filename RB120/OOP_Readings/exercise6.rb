=begin

Add a class method to your MyCar class that calculates the 
gas mileage (i.e. miles per gallon) of any car.

=end

class MyCar
  attr_accessor :color
  attr_reader :year

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

aventador = MyCar.new("Lamborghini Aventador", "Lavendar", 3000)
MyCar.miles_per_gallon(20, 300)