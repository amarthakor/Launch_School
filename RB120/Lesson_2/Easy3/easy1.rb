=begin

If we have this code:

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

What happens in each of the following cases:

case 1:
hello = Hello.new
hello.hi

case 2:
hello = Hello.new
hello.bye

case 3:
hello = Hello.new
hello.greet

case 4:
hello = Hello.new
hello.greet("Goodbye")

case 5:
Hello.hi
=end

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

# case 1:
hello = Hello.new
hello.hi # outputs 'Hello'

# case 2:
hello = Hello.new
hello.bye # returns undefined error because 'bye' method is not defined in Hello class
# or GReeting superclass, but rather Goodbye class

# case 3:
hello = Hello.new
hello.greet # return ARgumentError as method requires one argument defined

# case 4:
hello = Hello.new
hello.greet("Goodbye") # outputs 'Goodebye'

# case 5:
Hello.hi # return no method error as this is an instance method which can only be invoked
# on instance objects, here Hello is a class object