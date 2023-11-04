require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message, interpolation = {})
  Kernel.puts("> #{format(MESSAGES[LANGUAGE][message], interpolation)}")
end

def valid_number?(num)
  num.to_i().to_s() == num || num.to_f().to_s() == num
end

def valid_operator?(op)
  %w(1 2 3 4).include?(op)
end

# outputs the calculation choice user chose
def calc_msg(operator)
  case operator
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

# gets user name
def get_name
  prompt('welcome')

  name = ''
  loop do
    name = Kernel.gets().chomp()

    name.empty? || name =~ /\s/ ? prompt('invalid_name') : break
  end

  name.capitalize!
end

# gets numbers from user
def get_num(number)
  prompt(number)

  num = ''
  loop do
    num = Kernel.gets().chomp()
    if valid_number?(num)
      break
    else
      prompt('invalid_number')
    end
  end
  num
end

# gets user operation choice
def get_operation_choice
  operation_choice = ''
  loop do
    operation_choice = Kernel.gets().chomp()

    if valid_operator?(operation_choice)
      break
    else
      prompt("invalid_operator")
    end
  end

  operation_choice
end

# calculates user answer
def user_answer(choice, number1, number2)
  case choice
  when '1'
    number1.to_f() + number2.to_f()
  when '2'
    number1.to_f() - number2.to_f()
  when '3'
    number1.to_f() * number2.to_f()
  when '4'
    if number2 == '0'
      prompt("zero_div_error")
    else
      number1.to_f() / number2.to_f()
    end
  end
end

def display_result(result)
  if !result.nil?
    prompt('result', result: result.round(2))
  end
end

# main code
name = get_name

# begin main loop
loop do # get user numbers
  num1 = get_num('get_num1')
  num2 = get_num('get_num2')

  # prompt possible operation choices message
  prompt('operation_choice_prompt')

  operation_choice = get_operation_choice

  Kernel.puts("=> #{calc_msg(operation_choice)} the two numbers...")

  answer = user_answer(operation_choice, num1, num2)

  display_result(answer)

  prompt('repeat_calc')

  another_calc = Kernel.gets().chomp()

  break unless another_calc.downcase().start_with?('y')
end

prompt('end_prompt', name: name)
