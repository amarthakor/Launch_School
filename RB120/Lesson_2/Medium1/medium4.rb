=begin

Let's practice creating an object hierarchy.

Create a class called Greeting with a single instance method called 
greet that takes a string argument and prints that argument to the terminal.

Now create two other classes that are derived from Greeting: one called 
Hello and one called Goodbye. The Hello class should have a hi method that 
takes no arguments and prints "Hello". The Goodbye class should have a bye 
method to say "Goodbye". Make use of the Greeting class greet method when 
implementing the Hello and Goodbye classes - do not use any puts in the 
Hello or Goodbye classes.

- Create class Greeting
  - Single instance method called 'greet'
    - takes string arugment and prints argument to terminal

- Create class Hello
  - method 'hi' (instnace or class?)
    -takes no arugments, prints 'hi'


- Create class Goodbye
  - method 'bye' (instance or class?)
    - takes no arugments and prints 'hoodbye'

- Greeting should be superclass to Hello and Goodbye class
  - Make use of the 'greet' method defined in superclass 
- Hello / Goodbye classes should not contian any puts invocations

=end

class Greeting
  def greet(msg)
    puts msg
  end
end

class Hello < Greeting
  def hi
    greet('Hello')
  end
end

class Goodbye < Greeting
  def bye
    greet('Goodbye')
  end
end

a = Hello.new
a.hi
b = Goodbye.new
b.bye