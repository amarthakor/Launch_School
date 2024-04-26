=begin

Alan created the following code to keep track of items 
for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?

=end

# Within the body of the 'update_quantiy' method, we initialize a local variable
# 'quantity' and set it to the return value of 'updated_count'. We probably meant
# to reassign the value referenced by @quantity, however it is not accessable
# because no setter method has been defined, only a getter method.
# Thus, if we change attr_reader :quantity to attr_accessor :quantity and 
# changed the method body from 'quantity = updated_count...' to 'self.quantity =...',
# we would create both a setter and getter method, which would allow the code to
# function as intended. If we didnt want to make a setter method, we could change 
# quantity to @quantity within the update_qunatity method