=begin

Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?

=end

# Ben is right. Because Ben added the attr_reader :balance on line 2,
# a getter method is created that returns the value of @balance, thus
# within the method body of 'positive_balance?', balance references
# the value referenced by @balance

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

amar_account = BankAccount.new(100)
puts amar_account.positive_balance? # returns boolean because balance refers to @balance