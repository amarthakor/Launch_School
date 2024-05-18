require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money

  end
end