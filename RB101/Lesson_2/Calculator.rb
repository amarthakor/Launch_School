## Command line calculator program
## ask user to input 2 numbers
# ask for operaiton type that will be preformed on those 2 numbers
# output the value of said numbers/operation
Kernel.puts("Welcome to Calculator")
Kernel.puts("Please enter two integer values")
num1 = Kernel.gets().chomp()
num2 = Kernel.gets().chomp()

Kernel.puts("You entered #{num1} and #{num2}")
Kernel.puts("Which operation would you like to perform? Addition,
subtraction, multiplication, or division?")
operation = Kernel.gets().chomp().downcase

if operation == 'addition'
  Kernel.puts("#{num1} + #{num2} = #{num1.to_i() + num2.to_i()}")
elsif operation == 'multiplication'
  Kernel.puts("#{num1} * #{num2} = #{num1.to_i() * num2.to_i()}")
elsif operation == 'subtraction'
  Kernel.puts("#{num1} - #{num2} = #{num1.to_i() - num2.to_i()}")
else operation == 'division'
  Kernel.puts("#{num1} / #{num2} = #{num1.to_f() / num2.to_f()}")
end
