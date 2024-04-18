=begin
Override the to_s method to create a user friendly print out of your object.
=end


class MyCar
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

  def to_s
    "My #{model} is a sexy #{color} and goes faster than any other car in the universe"
  end
end

aventador = MyCar.new("Lamborghini Aventador", "Lavendar", 3000)
puts aventador