=begin

Create a module named Transportation that contains three classes: 
Vehicle, Truck, and Car. 

Truck and Car should both inherit from Vehicle.

=end

module Transportation

  class Vehicle
    attr_reader :year

    def initialize(year)
      @year = year
    end
  end

  class Car < Vehicle
  end

  class Truck < Vehicle
  end
end

lambo = Transportation::Car.new(3000)
p lambo
puts lambo.year