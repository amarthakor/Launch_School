=begin
4:45pm

Inside a preschool there are children, teachers, class assistants, a principle,
 janitors, and cafeteria workers. Both teachers and assistants can help a 
 student with schoolwork and watch them on the playground. A teacher teaches
and an assistant helps kids with any bathroom emergencies. Kids themselves 
can learn and play. A teacher and principle can supervise a class. Only the 
principle has the ability to expel a kid. Janitors have the ability to clean.
Cafeteria workers have the ability to serve food. Children, teachers, class
assistants, principles, janitors and cafeteria workers all have the ability 
to eat lunch.

- Domain is preschool
  - children
  - teachers
  - class assistants
  - a principle
  - janitors
  - cafeteria workers

  - teachers and assistants # module
    - help with school work
    - watch on playground
  - teacher # class
    - teaching
  - assistant # class
    - bathroom emergencies
  - children # class
    - learn
    - play
  - teacher and principle # module
    - supervise class
  - principle # class method
    - expel student
  - janitors # class method
    - clean
  - cafeteria workers # class method
    - serve food
  
=end

module Duties
  def helping
    "I'm going to help the children with their schoolwork now!"
  end

  def watching
    puts "I'm going to watch the children on the playground now!"
  end
end

module Supervisable
  def supervising
    puts "I am supervising the class of children right now."
  end
end

class Preschool
  def initialize(name)
    @name = name
  end

  def eat_lunch
    puts "I am eating lunch right now!"
  end
end

class Children < Preschool
  def learn
    puts "I love learning calculus!"
  end

  def play
    puts "I love playing outside in the mud!"
  end
end

class Teachers < Preschool
  include Duties
  include Supervisable

  def teaching
    puts "I love teaching!"
  end
end

class Assistant < Preschool
  include Duties

  def bathroom_emergency
    puts "I help the children with bathroom emergencies!"
  end
end

class Principle < Preschool
  include Supervisable

  def expels
    puts "YOU'RE EXPELLED!!!!!"
  end
end

class Janitors < Preschool
  def cleans
    puts "I'm love cleaning the school!"
  end
end

class CafeteriaWorker < Preschool
  def serves_food
    puts "I am serving pizza for lunch today!"
  end
end