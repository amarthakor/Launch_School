## Command line calculator program
## ask user to input 2 numbers
# ask for operation type that will be preformed on those 2 numbers
# output the value of said numbers/operation
def prompt(message)
  Kernel.puts("> #{message}")
end

def valid_integer(number)
  number.to_i != 0
end

prompt("Whats your name?")
name = Kernel.gets().chomp()

prompt("Hello #{name} and welcome to calculator!")

loop do
  num1 = ''
  loop do
    prompt("Please enter the first number")
    num1 = Kernel.gets().chomp()

    if valid_integer(num1)
      break
    else
      prompt("That doesn't appear to be a valid number, please try again")
    end
  end

  num2 = ''
  loop do
    prompt("Please enter the second number")
    num2 = Kernel.gets().chomp()

    if valid_integer(num2)
      break
    else
      prompt("That doesn't appear to be a valid number, please try again")
    end
  end

  prompt("You entered #{num1} and #{num2}")
  operations_choice = <<-ABC
  Which operation would you like to perform?
    addition
    subtraction
    multiplication
    division
    ABC

  prompt(operations_choice)

  operation = ''
  loop do
    operation = Kernel.gets().chomp().downcase

    if %w(addition subtraction multiplication division).include?(operation)
      break
    else
      prompt("Error, that is not a possible operation, please try again")
    end
  end

  if operation == 'addition'
    result = num1.to_i + num2.to_i
  elsif operation == 'multiplication'
    result = num1.to_i * num2.to_i
  elsif operation == 'subtraction'
    result = num1.to_i - num2.to_i
  else
    result = num1.to_f / num2.to_f
  end

  prompt("The result is #{result}")

  prompt("Would you like to perform another calculation? Press 'y' to restart")
  repeat = Kernel.gets().chomp()
  break if repeat != 'y'
end

prompt("Thank you for using calculator #{name}, have a great day!")
