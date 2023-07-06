## Command line calculator program
## ask user to input 2 numbers
# ask for operation type that will be preformed on those 2 numbers
# output the value of said numbers/operation
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message, interpolation = {})
  Kernel.puts("> #{format(MESSAGES[message], interpolation)}")
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

prompt('name')

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty? || name =~ /\s/
    prompt(MESSAGES['valid_name'])
  else break
  end
end

prompt('welcome', name: name)

loop do
  num1 = ''
  loop do
    prompt('number_1')
    num1 = Kernel.gets().chomp()

    if valid_integer(num1)
      break
    elsif valid_float(num1)
      break
    else
      prompt('invalid_num')
    end
  end

  operation = ''
  num2 = ''
  loop do
    num2 = ''
    loop do
      prompt('number_2')
      num2 = Kernel.gets().chomp()

      if valid_integer(num2)
        break
      elsif valid_float(num2)
        break
      else
        prompt('invalid_num')
      end
    end

    prompt('number_choices', num1: num1, num2: num2)
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
        prompt('invalid_operation')
      end
    end

    if num2.to_f == 0 && operation == '4'
      prompt('zero_div_error')
    else
      break
    end
  end

  Kernel.puts("> #{operation_to_message(operation)} the two numbers...")

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

  prompt('result', result: result)

  prompt('another_calculation?')
  repeat = Kernel.gets().chomp().downcase()
  break if repeat != 'y'
end

prompt('end_prompt', name: name)
