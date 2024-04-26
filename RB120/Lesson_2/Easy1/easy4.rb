=begin

If we have a class AngryCat how do we create a new instance of this class?

The AngryCat class might look something like this:


class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

=end

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

cat = AngryCat.new
cat.hiss

puts "We create, or instantiate, a new isntance of the AngryCat class invoking the '.new' 
method chained to the name of the class. This in turn returns a new object of the
invoked class"