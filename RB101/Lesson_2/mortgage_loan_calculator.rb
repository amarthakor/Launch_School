# mortgage calculator program
# methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number(number)
  (number.to_i.to_s == number || number.to_f.to_s == number) && number.to_f > 0
end

def get_name
  prompt("Welcome to mortgage calculator! Whats your name?")

  name = ''
  loop do
    name = Kernel.gets().chomp()

    name.empty? || name =~ /\s/ ? prompt("Please enter a valid name.") : break
  end

  name.capitalize!
end

def get_loan_amount
  prompt("What is the amount of your loan?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_number(loan_amount)
      break
    else
      prompt("Please enter a valid loan amount that is greater than 0")
    end
  end
  loan_amount.to_f
end

def get_apr
  prompt("What is your Annual Percentage Rate?")

  apr = ''
  loop do
    apr = Kernel.gets().chomp()

    if valid_number(apr)
      break
    else
      prompt("Please enter a valid APR, if your APR is under 1%, add a 0 in front")
    end
  end
  apr = apr.to_f / 100 / 12
end

def get_loan_duration
  prompt("How long is your loan duration in years?")

  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()
    if valid_number(loan_duration)
      break
    else
      prompt("Error, your loan duration should be greater than 0 and in years")
    end
  end
  loan_duration.to_f * 12
end

def calc_mortgage(loan, mpr, length)
  loan * (mpr / (1 - (1 + mpr)**(-length)))
end

# main code
name = get_name

# main program loop
loop do
  loan_amount = get_loan_amount

  monthly_rate = get_apr

  loan_duration = get_loan_duration

  prompt("Calculating your monthly mortgage payment...")

  mortgage = calc_mortgage(loan_amount, monthly_rate, loan_duration).round(2)

  prompt("Your monthly payment will be #{mortgage}")

  prompt("Would you like to perform another calculation? Press 'Y' to restart")

  repeat = Kernel.gets().chomp().downcase
  break unless repeat.start_with?('y')
end

prompt("Thank you for using mortgage calculator #{name}, come back soon!")
