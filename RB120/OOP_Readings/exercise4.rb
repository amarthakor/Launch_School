=begin

Add an accessor method to your MyCar class to change and view the color of 
your car. Then add an accessor method that allows you to view, but not
modify, the year of your car.


- add accessir nethod to MyCar to change or view COLOR of car
- add accessor method to view, but NOT CHANGE, year of car
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

aventador = MyCar.new("Lamborghini Aventador", "Lavendar", 2102)
puts aventador.color
aventador.color = 'Beige'
puts aventador.color
puts aventador.year