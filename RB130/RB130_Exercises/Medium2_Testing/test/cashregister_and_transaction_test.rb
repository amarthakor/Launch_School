require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!
require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTest < Minitest::Test
  attr_accessor :register, :burger

  def setup
    @register = CashRegister.new(500)
    @burger = Transaction.new(5.0)
  end

  def test_accept_money
    burger.amount_paid = 5.0
    assert_equal(505, register.accept_money(burger))
  end

  def test_change
    payment = burger.amount_paid = 10.0
    change = burger.amount_paid - burger.item_cost
    assert_equal(5, change)
  end

  def test_give_receipt
    transaction = burger.item_cost
    assert_output("You've paid $5.0.\n") { register.give_receipt(burger) }
  end
end