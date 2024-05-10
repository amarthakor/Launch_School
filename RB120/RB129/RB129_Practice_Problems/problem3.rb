# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing 


####################### module use case #######################
# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Monster
#   include Attackable
# end

# class Barbarian
#   include Attackable
# end

# barb = Barbarian.new.attack
# puts barb
# mons = Monster.new.attack
# puts mons

###################### Class inheritance use case ######################

# class Character
#   def attack
#     "attacks!"
#   end
# end

# class Monster < Character; end

# class Barbarian < Character; end

# barb = Barbarian.new.attack
# puts barb
# mons = Monster.new.attack
# puts mons

###################### duck typing use case ######################

class Monster
  def attack
    "Monster attack!"
  end
end

class Barbarian
  def attack
    "Barbarian swing!"
  end
end

characters = [Monster.new, Barbarian.new]
characters.each {|character| puts character.attack }
