=begin

If we have this class:

class Game
  def play
    "Start the game!"
  end
end
And another class:

class Bingo
  def rules_of_play
    #rules of play
  end
end


What can we add to the Bingo class to allow it to inherit the play method from the Game class?

=end

# class Bingo < Game  # Here we added ' < Game' so that Bingo can inherit from Game class
#   def rules_of_play
#     #rules of play
#   end
# end

puts "We can add the synax ' < Game' next to 'class Bingo' on line 12"

