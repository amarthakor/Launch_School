# Given the following classes, implement the necessary methods to get the expected output.

class DataBase
  attr_reader :things

  def initialize
    @things = []
  end

  def <<(other)
    if !things.include?(other)
      things << other
    else
      puts "That student is already in the database"
    end
  end

  def show_things
    things.each {|student| puts "A #{student.class}: #{student.name}"}
  end
end

class Student
  attr_reader :id, :name

  def initialize(name, id)
    @name = name
    @id = id
  end

  def ==(other)
    id == other.id
  end
end

jill1 = Student.new('Jill', 12345)
jill2 = Student.new('Jill', 67890)
jill3 = Student.new('Jill', 12345)

puts jill1 == jill2              # false, what is being compared?
puts jill1 == jill3              # true, ID is being compared since strings are same value, different objects

kids = DataBase.new

kids << jill1
kids << jill2
kids << jill3               # => That student is already in the database
# want to make sure that newly appended object is only appended if the current array
# does not contain the argument already

  # array << student argument IF array does not contain (student argument) already

kids.show_things
  # => A Student: Jill
  # => A Student: Jill