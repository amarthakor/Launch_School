# LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    "I am #{self.name}, I am a #{self.class.to_s.downcase} and I can fly!"
  end
end

class Superhero    
  include Flightable

  attr_accessor :ability
  attr_reader :name
  
  def self.fight_crime
    puts "I am #{self}!"
    lsman = LSMan.new('LSMan')
    lsman.announce_ability
  end
  
  def initialize(name, ability=Ability.new("coding skills"))
    @name = name
    @ability = ability
  end
  
  def announce_ability
    puts "I fight crime with my #{ability.description} ability!"
  end
end

class LSMan < Superhero
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman', Ability.new('Laser Eyes')) # Instantiate superhero object with one argument, 'Superman'
puts superman.announce_ability
p superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime 
# => I am LSMan!
# => I fight crime with my coding skills ability!
# ==================================================