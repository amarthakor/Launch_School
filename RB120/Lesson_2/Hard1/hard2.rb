=begin

Building on the prior vehicles question, we now must also track a basic motorboat. 
A motorboat has a single propeller and hull, but otherwise behaves similar 
to a catamaran. Therefore, creators of Motorboat instances don't need 
to specify number of hulls or propellers. How would you modify the vehicles 
code to incorporate a new Motorboat class?

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
end

class Catamaran < Ships

end

class Motorboat < Ships

end

# - Create motorboat class
#   - motorboat has single properller and hull, dont need to specify number of hulls or propellers
#   - similar behavior to catarman
#   - how would u modify the vehicles code to incorporate new motorboat class?

catam = Catamaran.new(3, 2, 10, 10.0)
puts catam.hull_count
boat = Motorboat.new(12, 10.0)
puts boat.range
puts boat.propeller_count
