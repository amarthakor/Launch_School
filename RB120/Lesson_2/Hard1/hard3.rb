=begin

The designers of the vehicle management system now want to make an adjustment 
for how the range of vehicles is calculated. For the seaborne vehicles, due 
to prevailing ocean currents, they want to add an additional 10km of range 
even if the vehicle is out of fuel.

Alter the code related to vehicles so that the range for autos and motorcycles 
is still calculated as before, but for catamarans and motorboats, the range method 
will return an additional 10km.

=end

module Rangeable
  attr_accessor :speed, :heading, :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Rangeable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Ships
  include Rangeable
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers= 1, num_hulls= 1, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_hulls
    @hull_count = num_propellers
    self.fuel_capacity = liters_of_fuel_capacity
    self.fuel_efficiency = km_traveled_per_liter
  end

  def range
    super + 10
  end
end

class Catamaran < Ships

end

class Motorboat < Ships

end

cata = Catamaran.new(3, 2, 10, 10.0)
puts cata.range # => 110.0
boat = Motorboat.new(12, 10.0)
puts boat.range # => 130.0