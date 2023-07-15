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
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_float?(number)
  number.to_f.to_s == number
  number.to_f
end

def greater_than_0(number)
  number.to_f > 0
end

# insure loan is greater > 0

loan_amount = ''
apr = ''
loan_years = ''
monthly_payment = ''

# main code
prompt "Hello and welcome to mortgage loan calculator!"

loop do
  prompt "What is the amount of your loan?"

  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_float?(loan_amount) && greater_than_0(loan_amount)
      break
    else
      prompt "That is not a valid loan amount"
      prompt "Please ensure that the loan is greater than $0"
    end
  end

  prompt "What is the Anual Percentage Rate on your loan (in %)"

  loop do
    apr = Kernel.gets().chomp()
    if valid_float?(apr) && greater_than_0(apr)
      break
    else
      prompt "That is not a valid APR"
      prompt "Please ensure that the APR that is greater than 0"
    end
  end

  prompt "How long is the duration of your loan in years"
  loan_months = ''
  loop do
    loan_years = Kernel.gets().chomp()
    if valid_float?(loan_years) && greater_than_0(loan_years)
      break
    else
      prompt "That is not a valid loan duration"
      prompt "Please ensure that the loan duration is greater than 0"
    end
  end
  monthly_rate = apr.to_f / 100 / 12
  loan_months = loan_years.to_f * 12
  loan_amount = loan_amount.to_f

  # monthly paymeny calculation
  # (1 - (1 + monthly_rate)**(-loan_months)))
  prompt "Thank you, calculator will now begin to calculate your monthly payment!"

  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))
  prompt "Your monthly payment is #{monthly_payment}"

  # repeat calculation or end program
  prompt "Enter 'y' if you would like to perform a new calculation"

  repeat = Kernel.gets().chomp()
  break unless repeat.downcase().start_with?('y')
end
