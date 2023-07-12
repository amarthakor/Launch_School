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
#   (i.e. years to months, % to decimal, etc.)
# --------------------------------------------
# methods
def prompt(message)
  Kernel.puts("=> #{message}")
end


# main code




# exit prompt