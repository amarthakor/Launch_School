#describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters 
  
  def initialize(name) 
    #
    self.name 
    @characters = [] 
  end
  
  def display
    name
  end
  
  protected 
  attr_reader :name
  attr_writer :name
end

class Monster < Characters # Monsters can attack
  include Attackable
  
  def initialize(name)
    super
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self) # 
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb') # instantiate barbarian class object
rob = Monster.new('monst')    # instantiate monster class object
conan.characters << rob       # referenceing the array directly, so << will not raise error

p conan.display               # uses getter method to expose state of @name..., outputs name
                              #   but name hasn't been iniitalized to reference anything yet?
                              # also what does self.name act like? object.name retrievers name
                              # but not set, so nil
