=begin

If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end


What would happen if we added a play method to the Bingo class,
keeping in mind that there is already a method of this name in the 
Game class that the Bingo class inherits from.

=end

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    'hi'
  end
end

puts "If we add a newly defined play method within the Bingo class, then whenever
Bingo#play is invoked, it'll automatically execute the #play found within the class,
as we have now overriden the inherited #play method."