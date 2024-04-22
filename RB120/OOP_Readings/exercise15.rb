=begin

Create a class 'Student' with attributes name and grade. 
Do NOT make the grade getter public, so joe.grade will raise 
an error. Create a better_grade_than? method, that you can call like so...

puts "Well done!" if joe.better_grade_than?(bob)

- Create a class called 'student' w/ attr name and grade
- make grade getter private
- create better_grade_than?() method
  - this method should be able to output statement if current students grade
    is better than argument students grade

=end

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other)
    grade > other.grade
  end

  protected
  attr_reader :grade
end

joe = Student.new('Joe', 99)
bob = Student.new('Schmo', 90)

puts "Well done!" if joe.better_grade_than?(bob)