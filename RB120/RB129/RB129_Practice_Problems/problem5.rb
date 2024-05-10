class BenjaminButton 
  attr_accessor :actual_age, :appearance_age

  def initialize
    @actual_age = 0
    @appearance_age = 100
  end
  
  def get_older
    self.actual_age += 1
    self.appearance_age -= 1
  end
  
  def look_younger
    # looks are based on apperance, thus
    # 'look_younger' would decrease the age
    # but appearance_age is inversely related to
    # actual_age, thus looking younger by one year
    # means getting older by one year age wise
    # which means look_younger and get_older are the same???
  end
  
  def die
    self.actual_age = 100
    self.appearance_age = 0
  end
end

class BenjaminButton
end


benjamin = BenjaminButton.new #no arguments passed to constructor
p benjamin.actual_age # => 0
p benjamin.appearance_age # => 100

benjamin.actual_age = 1
p benjamin.actual_age

benjamin.get_older # incremenets by 1
p benjamin.actual_age # => 2
p benjamin.appearance_age # => 99

benjamin.die
p benjamin.actual_age # => 100
p benjamin.appearance_age # => 0


# looks like we have two instance variables to expose 
# values of the state of our object...
  # - @actual_age
  # - @appearanec_age
  # former set to 0, latter set to 100 on instantiation...
  # need way to retrieve these values as well...