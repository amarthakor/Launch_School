# Namespace example

module Existential # represents the conceptual abstraction plane
  class Plane
  
  end
end

module Vehicle # Represents the aeroplane Plane
  class Plane
  
  end
end

higher_being = Existential::Plane.new
boeing737 = Vehicle::Plane.new

p higher_being, boeing737


