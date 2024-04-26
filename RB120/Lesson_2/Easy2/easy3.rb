=begin
How do you find where Ruby will look for a method when that method is called?
How can you find an object's ancestors?


module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

What is the lookup chain for Orange and HotSauce?

=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts "You can find where Ruby will look for a method when it is invoked by 
following the method lookup path. This is a heirarchical list that Ruby
follows when looking for a method definition to execute for the method invoked."

puts
puts "You can find an object's ancestors, or lookup path, by calling the #ancestors 
method"

puts Orange.ancestors
puts ' ---------------- '
puts HotSauce.ancestors