=begin

Now that we have a Walkable module, we are given a new challenge. 
Apparently some of our users are nobility, and the regular way of walking 
simply isn't good enough. Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:


byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"


We must have access to both name and title because they are needed for 
other purposes that we aren't showing here.

byron.name
=> "Byron"
byron.title
=> "Lord"

=end

module Walkable
  def walk
    puts "#{name} #{gait} forward"
  end
end

class Noble
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    puts "#{title} #{name} #{gait} forward"
  end

  private

  def gait
    "struts"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"


p byron.name
# => "Byron"
p byron.title
# => "Lord"