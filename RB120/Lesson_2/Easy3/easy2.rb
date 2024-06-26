=begin
In the last question we had the following classes:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

If we call Hello.hi we get an error message. How would you fix this?

=end

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting

  def self.hi # Here we added the class method 'hi'
    puts 'hi'
  end

  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi # this will invoke the class method defined on lines 34-36