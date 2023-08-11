# create a program that will calculate monthly interest rate, loan duration
# in months, and monthly payment based off the user's input.
# finally, ask the user if they would like to repeat calculations
# with new values for the inputs
#
# input variables:
#     1) loan amount
#     2) APR (anual percentage rate)
#     3) loan duration
# output variables:
#     1) monthly interest rate
#     2) loan duration in months
#     3) monthly payment
#
# output variables will be calculated using the formula:
#  m = p * (j / (1 - (1 + j)**(-n))), where
#         m = monthly payment
#         p = loan amount
#         j = monthly interest rate
#         n = loan duration in months
#
# validation:
#   inputs and outputs will be expressed as integers/floats only
#   some input/output data may need to be converted to ideal datatype
#   (i.e. years to months, % to float value, etc.)
#   loan amount/interest rates/ duration of line CANNOT <= 0
#
# - begin program
# - welcome user to MLCalculator
# - ask for loan amount
#     - validate loan input
# - ask for APR amount in %
#     - validate APR amount
#     - convert APR % to float/integer value
#     - convert to MONTHLY rate by APR number / 12 (months)
# - ask for loan duration in years
#     - validate loan duration
#     - multiply loan duration year x 12 (months)
# - calculate monthly payment using formula + variables provided
# - ask user if they would like to repeat calculation w/ different amounts
# - if yes, loop back to beginning
# - if no, terminate program
# --------------------------------------------
# methods
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  Kernel.puts("=> #{(MESSAGES[message])}")
end

def valid_float?(number)
  number.to_f
end

def greater_than_0(number)
  number.to_f > 0
end

loan_amount = ''
apr = ''
loan_years = ''
monthly_payment = ''
loan_months = ''

# main code
prompt('welcome')

loop do
  prompt('loan_amount?')

  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_float?(loan_amount) && greater_than_0(loan_amount)
      break
    else
      prompt('invalid_loan')
      prompt('loan_greater_0')
    end
  end

  prompt('apr?')

  loop do
    apr = Kernel.gets().chomp()
    if valid_float?(apr) && greater_than_0(apr)
      break
    else
      prompt('invalid_apr')
      prompt('apr_greater_0')
    end
  end

  prompt('loan_duration_yrs')

  loop do
    loan_years = Kernel.gets().chomp()
    if valid_float?(loan_years) && greater_than_0(loan_years)
      break
    else
      prompt('invalid_loan_duration')
      prompt('loan_duration_0')
    end
  end
  monthly_rate = apr.to_f / 100 / 12
  loan_months = loan_years.to_f * 12
  loan_amount = loan_amount.to_f

  # monthly payment calculation
  prompt('calculating_monthly_payment')

  monthly_payment = loan_amount *
                    (monthly_rate /
                     (1 - (1 + monthly_rate)**(-loan_months)))
  prompt('monthly_payment')
  Kernel.puts("$#{monthly_payment.round(2)}")
  # repeat calculation or end program
  prompt('repeat?')

  repeat = Kernel.gets().chomp()
  break unless repeat.downcase().start_with?('y')
end
