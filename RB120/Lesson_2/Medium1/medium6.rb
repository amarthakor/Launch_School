=begin

If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

and

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template
  end
end

What is the difference in the way the code works?

=end

# In the frist example, within the show_template method, we retrieve the value of @template
# which is "template 14231"

# In the second example, within the show_template method, we retrieve the value of the 
# isntance object instnace variable @template, which is 'tempalte 14231'. Here 'self'
# denotes the instace object, but is not required to function as intended.

# Both code snippets function the same, the second one just includes 'self', which
# is not required when retrieiving or getting the value of an instance variable