# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power. Do not
# worry about validating the input.

# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103

def get_num(num)
  puts "==> Enter the #{num} number"
  gets.chomp.to_i
end

def perform_add_operation(first, second)
  puts "==> #{first} + #{second} = #{first + second}"
end

def perform_subtract_operaiton(first, second)
  puts "==> #{first} - #{second} = #{first - second}"
end

def perform_times_operation(first, second)
  puts "==> #{first} * #{second} = #{first * second}"
end

def perform_div_operation(first, second)
  puts "==> #{first} / #{second} = #{first / second}"
end

def perform_remainder_operation(first, second)
  puts "==> #{first} % #{second} = #{first % second}"
end

def perform_power_operation(first, second)
  puts "==> #{first} ** #{second} = #{first ** second}"
end

first_num = get_num('first')
second_num = get_num('second')

perform_add_operation(first_num, second_num)
perform_subtract_operaiton(first_num, second_num)
perform_times_operation(first_num, second_num)
perform_div_operation(first_num, second_num)
perform_remainder_operation(first_num, second_num)
perform_power_operation(first_num, second_num)
