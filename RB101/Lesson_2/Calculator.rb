## Command line calculator program
## ask user to input 2 numbers
# ask for operation type that will be preformed on those 2 numbers
# output the value of said numbers/operation
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("> #{message}")
end

def valid_integer(number)
  number.to_i.to_s == number
end

def valid_float(number)
  number.to_f.to_s == number
end

def operation_to_message(operator)
  if operator == '1'
    "Adding"
  elsif operator == '2'
    "Subtracting"
  elsif operator == '3'
    "Multiplying"
  else
    "Dividing"
  end
end

prompt("Whats your name?")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty? || name =~ /\s/
    prompt("Please enter a valid name")
  else break
  end
end

prompt("Hello #{name} and welcome to calculator!")

loop do
  num1 = ''
  loop do
    prompt("Please enter the first number")
    num1 = Kernel.gets().chomp()

    if valid_integer(num1)
      break
    elsif valid_float(num1)
      break
    else
      prompt("That doesn't appear to be a valid number, please try again")
    end
  end

  operation = ''
  num2 = ''
  loop do
    num2 = ''
    loop do
      prompt("Please enter the second number")
      num2 = Kernel.gets().chomp()

      if valid_integer(num2)
        break
      elsif valid_float(num2)
        break
      else
        prompt("That doesn't appear to be a valid number, please try again")
      end
    end

    prompt("You entered #{num1} and #{num2}")
    operations_choice = <<-MSG
    Which operation would you like to perform?
      Press 1 for addition
      Press 2 for subtraction
      Press 3 for multiplication
      Press 4 for division
      MSG

    prompt(operations_choice)

    loop do
      operation = Kernel.gets().chomp()

      if %w(1 2 3 4).include?(operation)
        break
      else
        prompt("Error, that is not a possible operation, please try again")
      end
    end

    if num2.to_f == 0 && operation == '4'
      prompt("You can't divide a number by 0, please reenter the second number")
    else
      break
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers... ")

  result = ''
  if operation == '1'
    result = num1.to_f + num2.to_f
  elsif operation == '2'
    result = num1.to_f - num2.to_f
  elsif operation == '3'
    result = num1.to_f * num2.to_f
  else
    result = num1.to_f / num2.to_f
  end

  prompt("The result is #{result}")

  prompt("Would you like to perform another calculation? Press 'y' to restart")
  repeat = Kernel.gets().chomp().downcase()
  break if repeat != 'y'
end

prompt("Thank you for using calculator #{name}, have a great day!")
